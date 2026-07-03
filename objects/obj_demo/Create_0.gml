x = 0;
y = 0;
z = 50;

randomize();

gamepad = undefined;
look_direction = 45;
look_pitch = 0;

mouse_was_locked = false;

vertex_format_begin();
vertex_format_add_position_3d();
vertex_format_add_normal();
vertex_format_add_texcoord();
vertex_format_add_colour();
format = vertex_format_end();

meshes = [];

var filename = file_find_first("models/*.vbuff", 0);
while (filename != "")
{
    var b = buffer_load($"models/{filename}");
    var vb = vertex_create_buffer_from_buffer(b, format);
    vertex_freeze(vb);
    buffer_delete(b);
    array_push(meshes, vb);
    filename = file_find_next();
}
file_find_close();

var add_point = function(vb, position, normal, texcoord, color, alpha)
{
    vertex_position_3d(vb, position[DDD_X], position[DDD_Y], position[DDD_Z]);
    vertex_normal(vb, normal[DDD_X], normal[DDD_Y], normal[DDD_Z]);
    vertex_texcoord(vb, texcoord[DDD_X], texcoord[DDD_Y]);
    vertex_colour(vb, color, alpha);
};

spawn_things = function(count, size)
{
    static threed_thing = function(source_mesh, source_position, source_rotation, source_angular_velocity) constructor
    {
        mesh = source_mesh;
        position = source_position;
        rotation = source_rotation;
        angular_velocity = source_angular_velocity;
        
        static update = function()
        {
            rotation = ddd_quat_multiply(rotation, angular_velocity);
        };
        
        static draw = function()
        {
            var matrix = ddd_quat_to_rotation_matrix(rotation);
            matrix = matrix_multiply(matrix, matrix_build(position[0], position[1], position[2], 0, 0, 0, 1, 1, 1));
            matrix_set(matrix_world, matrix);
            vertex_submit(mesh, pr_trianglelist, -1);
            matrix_set(matrix_world, matrix_build_identity());
        };
    };
    
    random_set_seed(62442);
    
    repeat (count)
    {
    	var position = ddd_vec3(random_range(-size, size), random_range(-size, size), random_range(0, size / 4));
    	var rotation = ddd_quat_identity();
    	var angular_velocity = (random(100) < 10)
    		? ddd_quat_from_euler(random_range(-1, 1), random_range(-1, 1), random_range(-1, 1))
    		: ddd_quat_from_euler(0, 0, 0);
    	
    	array_push(things, new threed_thing(meshes[irandom(array_length(meshes) - 1)], position, rotation, angular_velocity));
    }
    
    randomize();
}

#macro SIZE 400
#macro DEFAULT_COUNT ((os_type == os_switch)? 50 : 500)

things = [];
spawn_things(DEFAULT_COUNT, SIZE);

the_floor = vertex_create_buffer();
vertex_begin(the_floor, format);
add_point(the_floor, ddd_vec3(-SIZE, -SIZE, 0), ddd_vec3(0, 0, 1), ddd_vec2( 0,  0), #66aaff, 1);
add_point(the_floor, ddd_vec3( SIZE, -SIZE, 0), ddd_vec3(0, 0, 1), ddd_vec2(50,  0), #66aaff, 1);
add_point(the_floor, ddd_vec3( SIZE,  SIZE, 0), ddd_vec3(0, 0, 1), ddd_vec2(50, 50), #66aaff, 1);

add_point(the_floor, ddd_vec3( SIZE,  SIZE, 0), ddd_vec3(0, 0, 1), ddd_vec2(50, 50), #66aaff, 1);
add_point(the_floor, ddd_vec3(-SIZE,  SIZE, 0), ddd_vec3(0, 0, 1), ddd_vec2( 0, 50), #66aaff, 1);
add_point(the_floor, ddd_vec3(-SIZE, -SIZE, 0), ddd_vec3(0, 0, 1), ddd_vec2( 0,  0), #66aaff, 1);
vertex_end(the_floor);
vertex_freeze(the_floor);

surf_shadowmap_near = -1;
light_matrices_near = { };
surf_shadowmap_far = -1;
light_matrices_far = { };

view_mat = matrix_build_identity();
proj_mat = matrix_build_identity();

window_enable_borderless_fullscreen(true);

setting_fullscreen = false;
setting_things = DEFAULT_COUNT;
setting_shadowmap_size = 11;    // 2^x

dbg_view("Properties", true);
dbg_checkbox(ref_create(self, "setting_fullscreen"), "Fullscreen?");
dbg_slider(ref_create(self, "setting_things"), 25, DEFAULT_COUNT * 2, "Things");
dbg_slider(ref_create(self, "setting_shadowmap_size"), 8, (os_type == os_switch) ? 11 : 13, "Shadowmap size (2^x)", 1);