function _effect_windblown_particles_() constructor
{
	param_num_particles = 100;
	param_particle_spawn_time = 100;
	param_particle_spawn_all_at_start = 0;
	param_warmup_frames = 0;
	param_sprite = _effect_windblown_particles_leaf_sprite;
	param_particle_mass_min = 0.005;
	param_particle_mass_max = 0.01;
	param_particle_start_sprite_scale = 0.25;
	param_particle_end_sprite_scale = 0.25;
	param_particle_col_1 = [1, 1, 1, 1];
	param_particle_col_alt_1 = [1, 1, 1, 1];
	param_particle_col_2 = [1, 1, 1, 1];
	param_particle_col_alt_2 = [1, 1, 1, 1];
	param_particle_col_3 = [1, 1, 1, 1];
	param_particle_col_alt_3 = [1, 1, 1, 1];
	param_particle_col_4 = [1, 1, 1, 1];
	param_particle_col_alt_4 = [1, 1, 1, 1];
	param_particle_col_enabled_2 = 0;
	param_particle_col_enabled_3 = 0;
	param_particle_col_2_pos = 0.33;
	param_particle_col_3_pos = 0.66;
	param_particle_initial_velocity_range_x_min = -100;
	param_particle_initial_velocity_range_x_max = 100;
	param_particle_initial_velocity_range_y_min = -100;
	param_particle_initial_velocity_range_y_max = 100;
	param_particle_initial_rotation_min = 0;
	param_particle_initial_rotation_max = 360;
	param_particle_rot_speed_min = -360;
	param_particle_rot_speed_max = 360;
	param_particle_lifetime_min = 100;
	param_particle_lifetime_max = 100;
	param_particle_update_skip = 1;
	param_particle_spawn_border_prop = 0.25;
	param_particle_src_blend = 5;
	param_particle_dest_blend = 6;
	param_particle_align_vel = 1;
	param_trails_only = 0;
	param_trail_chance = 20;
	param_trail_lifetime_min = 0.1;
	param_trail_lifetime_max = 0.5;
	param_trail_thickness_min = 0.25;
	param_trail_thickness_max = 1;
	param_trail_col_1 = [1, 1, 1, 0.1];
	param_trail_col_alt_1 = [1, 1, 1, 0.25];
	param_trail_col_2 = [1, 1, 1, 0.1];
	param_trail_col_alt_2 = [1, 1, 1, 0.25];
	param_trail_col_3 = [1, 1, 1, 0.1];
	param_trail_col_alt_3 = [1, 1, 1, 0.25];
	param_trail_col_4 = [1, 1, 1, 0];
	param_trail_col_alt_4 = [1, 1, 1, 0];
	param_trail_col_enabled_2 = 1;
	param_trail_col_enabled_3 = 0;
	param_trail_col_2_pos = 0.5;
	param_trail_col_3_pos = 0.66;
	param_trail_min_segment_length = 20;
	param_trail_src_blend = 5;
	param_trail_dest_blend = 6;
	param_force_grid_sizex = 8;
	param_force_grid_sizey = 8;
	param_wind_vector_x = -4;
	param_wind_vector_y = -1;
	param_num_blowers = 3;
	param_blower_size_min = 0.2;
	param_blower_size_max = 0.6;
	param_blower_speed_min = 0.2;
	param_blower_speed_max = 0.5;
	param_blower_rot_speed_min = -180;
	param_blower_rot_speed_max = 180;
	param_blower_force_min = 5;
	param_blower_force_max = 15;
	param_blower_camvec_scale = -1;
	air_density = 0.01;
	param_dragcoeff = 1;
	param_grav_accel = 100;
	param_debug_grid = 0;
	debug_grid_alpha = 0.25;
	debug_force_scale = 10;
	particle_scale_compensation = 1;
	time_since_last_particle = 0;
	trails_use_trilists = 0;
	particle_col = array_create(4);
	particle_alpha = array_create(4);
	particle_col_alt = array_create(4);
	particle_alpha_alt = array_create(4);
	particle_col_pos = array_create(4);
	particle_col_dist = array_create(3);
	trail_col = array_create(4);
	trail_alpha = array_create(4);
	trail_col_alt = array_create(4);
	trail_alpha_alt = array_create(4);
	trail_col_pos = array_create(4);
	trail_col_dist = array_create(3);
	
	update_colours = function()
	{
		particle_col[0] = make_colour_rgb(param_particle_col_1[0] * 255, param_particle_col_1[1] * 255, param_particle_col_1[2] * 255);
		particle_col[1] = make_colour_rgb(param_particle_col_2[0] * 255, param_particle_col_2[1] * 255, param_particle_col_2[2] * 255);
		particle_col[2] = make_colour_rgb(param_particle_col_3[0] * 255, param_particle_col_3[1] * 255, param_particle_col_3[2] * 255);
		particle_col[3] = make_colour_rgb(param_particle_col_4[0] * 255, param_particle_col_4[1] * 255, param_particle_col_4[2] * 255);
		particle_col_alt[0] = make_colour_rgb(param_particle_col_alt_1[0] * 255, param_particle_col_alt_1[1] * 255, param_particle_col_alt_1[2] * 255);
		particle_col_alt[1] = make_colour_rgb(param_particle_col_alt_2[0] * 255, param_particle_col_alt_2[1] * 255, param_particle_col_alt_2[2] * 255);
		particle_col_alt[2] = make_colour_rgb(param_particle_col_alt_3[0] * 255, param_particle_col_alt_3[1] * 255, param_particle_col_alt_3[2] * 255);
		particle_col_alt[3] = make_colour_rgb(param_particle_col_alt_4[0] * 255, param_particle_col_alt_4[1] * 255, param_particle_col_alt_4[2] * 255);
		particle_alpha[0] = param_particle_col_1[3];
		particle_alpha[1] = param_particle_col_2[3];
		particle_alpha[2] = param_particle_col_3[3];
		particle_alpha[3] = param_particle_col_4[3];
		particle_alpha_alt[0] = param_particle_col_alt_1[3];
		particle_alpha_alt[1] = param_particle_col_alt_2[3];
		particle_alpha_alt[2] = param_particle_col_alt_3[3];
		particle_alpha_alt[3] = param_particle_col_alt_4[3];
		particle_col_pos[0] = 0;
		particle_col_pos[1] = param_particle_col_2_pos;
		particle_col_pos[2] = param_particle_col_3_pos;
		particle_col_pos[3] = 1;
		
		if (param_particle_col_enabled_3 == 0)
		{
			particle_col[2] = particle_col[3];
			particle_col_alt[2] = particle_col_alt[3];
			particle_alpha[2] = particle_alpha[3];
			particle_alpha_alt[2] = particle_alpha_alt[3];
			particle_col_pos[2] = 1;
		}
		
		if (param_particle_col_enabled_2 == 0)
		{
			particle_col[1] = particle_col[2];
			particle_col_alt[1] = particle_col_alt[2];
			particle_alpha[1] = particle_alpha[2];
			particle_alpha_alt[1] = particle_alpha_alt[2];
			particle_col_pos[1] = particle_col_pos[2];
		}
		
		particle_col_dist[0] = particle_col_pos[1] - particle_col_pos[0];
		particle_col_dist[1] = particle_col_pos[2] - particle_col_pos[1];
		particle_col_dist[2] = particle_col_pos[3] - particle_col_pos[2];
		trail_col[0] = make_colour_rgb(param_trail_col_1[0] * 255, param_trail_col_1[1] * 255, param_trail_col_1[2] * 255);
		trail_col[1] = make_colour_rgb(param_trail_col_2[0] * 255, param_trail_col_2[1] * 255, param_trail_col_2[2] * 255);
		trail_col[2] = make_colour_rgb(param_trail_col_3[0] * 255, param_trail_col_3[1] * 255, param_trail_col_3[2] * 255);
		trail_col[3] = make_colour_rgb(param_trail_col_4[0] * 255, param_trail_col_4[1] * 255, param_trail_col_4[2] * 255);
		trail_col_alt[0] = make_colour_rgb(param_trail_col_alt_1[0] * 255, param_trail_col_alt_1[1] * 255, param_trail_col_alt_1[2] * 255);
		trail_col_alt[1] = make_colour_rgb(param_trail_col_alt_2[0] * 255, param_trail_col_alt_2[1] * 255, param_trail_col_alt_2[2] * 255);
		trail_col_alt[2] = make_colour_rgb(param_trail_col_alt_3[0] * 255, param_trail_col_alt_3[1] * 255, param_trail_col_alt_3[2] * 255);
		trail_col_alt[3] = make_colour_rgb(param_trail_col_alt_4[0] * 255, param_trail_col_alt_4[1] * 255, param_trail_col_alt_4[2] * 255);
		trail_alpha[0] = param_trail_col_1[3];
		trail_alpha[1] = param_trail_col_2[3];
		trail_alpha[2] = param_trail_col_3[3];
		trail_alpha[3] = param_trail_col_4[3];
		trail_alpha_alt[0] = param_trail_col_alt_1[3];
		trail_alpha_alt[1] = param_trail_col_alt_2[3];
		trail_alpha_alt[2] = param_trail_col_alt_3[3];
		trail_alpha_alt[3] = param_trail_col_alt_4[3];
		trail_col_pos[0] = 0;
		trail_col_pos[1] = param_trail_col_2_pos;
		trail_col_pos[2] = param_trail_col_3_pos;
		trail_col_pos[3] = 1;
		
		if (param_trail_col_enabled_3 == 0)
		{
			trail_col[2] = trail_col[3];
			trail_col_alt[2] = trail_col_alt[3];
			trail_alpha[2] = trail_alpha[3];
			trail_alpha_alt[2] = trail_alpha_alt[3];
			trail_col_pos[2] = 1;
		}
		
		if (param_trail_col_enabled_2 == 0)
		{
			trail_col[1] = trail_col[2];
			trail_col_alt[1] = trail_col_alt[2];
			trail_alpha[1] = trail_alpha[2];
			trail_alpha_alt[1] = trail_alpha_alt[2];
			trail_col_pos[1] = trail_col_pos[2];
		}
		
		trail_col_dist[0] = trail_col_pos[1] - trail_col_pos[0];
		trail_col_dist[1] = trail_col_pos[2] - trail_col_pos[1];
		trail_col_dist[2] = trail_col_pos[3] - trail_col_pos[2];
	};
	
	reset = function()
	{
		frame = 0;
		particles = array_create(0);
		num_particles = 0;
		trail_min_segment_length_sq = param_trail_min_segment_length * param_trail_min_segment_length;
		force_grid_sizex = -1;
		force_grid_sizey = -1;
		force_grid = -1;
		force_grid_centrex = 0;
		force_grid_centrey = 0;
		force_grid_offsetx = 0;
		force_grid_offsety = 0;
		grid_margin = 1;
		last_view_centrex = 0;
		last_view_centrey = 0;
		blowers = array_create(0);
		num_blowers = 0;
		trails = array_create(0);
		num_trails = 0;
		views_minx = 0;
		views_maxx = 0;
		views_miny = 0;
		views_maxx = 0;
		views_centrex = 0;
		views_centrey = 0;
		update_colours();
		sprwidth = sprite_get_width(param_sprite);
		sprheight = sprite_get_height(param_sprite);
		particle_scale_compensation = 1;
	};
	
	cleanup = function()
	{
	};
	
	spawn_blower = function(argument0, argument1, argument2, argument3)
	{
		var blower = 
		{
			velx: (argument1 - argument0) * random_range(param_blower_speed_min, param_blower_speed_max),
			posy: random_range(argument2, argument3),
			size: random_range(param_blower_size_min, param_blower_size_max) * (argument1 - argument0),
			rotspeed: random_range((param_blower_rot_speed_min / 180) * pi, (param_blower_rot_speed_max / 180) * pi),
			rot: random_range(0, 2 * pi),
			force: random_range(param_blower_force_min, param_blower_force_max)
		};
		
		if (random(100) < 50)
			blower.velx = -blower.velx;
		
		if (blower.velx < 0)
			blower.posx = argument1 + blower.size;
		else
			blower.posx = argument0 - blower.size;
		
		return blower;
	};
	
	spawn_trail = function(argument0, argument1)
	{
		if (array_length(trails) <= num_trails)
			array_resize(trails, num_trails + 1);
		
		var lifetime_in_frames = argument0 * game_get_speed(gamespeed_fps);
		var num_segs = ceil(lifetime_in_frames) + 1;
		var trail = 
		{
			tail_segment: 0,
			head_segment: 0,
			lifetime: lifetime_in_frames,
			total_num_segs: num_segs,
			halfwidth: random_range(param_trail_thickness_min, param_trail_thickness_max) * argument1 * 0.5,
			num_segs: 0
		};
		trail.posx = array_create(num_segs);
		trail.posy = array_create(num_segs);
		trail.pt1_posx = array_create(num_segs);
		trail.pt1_posy = array_create(num_segs);
		trail.pt2_posx = array_create(num_segs);
		trail.pt2_posy = array_create(num_segs);
		trail.frame = array_create(num_segs);
		trail.alphascale = 1;
		var colblend = random_range(0, 1);
		trail.cols = array_create(4);
		trail.alphas = array_create(4);
		trail.cols[0] = merge_colour(trail_col[0], trail_col_alt[0], colblend);
		trail.cols[1] = merge_colour(trail_col[1], trail_col_alt[1], colblend);
		trail.cols[2] = merge_colour(trail_col[2], trail_col_alt[2], colblend);
		trail.cols[3] = merge_colour(trail_col[3], trail_col_alt[3], colblend);
		trail.alphas[0] = lerp(trail_alpha[0], trail_alpha_alt[0], colblend);
		trail.alphas[1] = lerp(trail_alpha[1], trail_alpha_alt[1], colblend);
		trail.alphas[2] = lerp(trail_alpha[2], trail_alpha_alt[2], colblend);
		trail.alphas[3] = lerp(trail_alpha[3], trail_alpha_alt[3], colblend);
		trails[num_trails] = trail;
		num_trails++;
		return trail;
	};
	
	add_trail_segment = function(argument0, argument1, argument2)
	{
		var totalnumsegs = argument0.total_num_segs;
		
		if (totalnumsegs < 2)
		{
			show_debug_message("Trail has less than two segments and is unusable.");
			exit;
		}
		
		if (argument0.num_segs == 0)
		{
			var headseg = argument0.head_segment;
			argument0.posx[headseg] = argument1;
			argument0.posy[headseg] = argument2;
			argument0.frame[headseg] = frame;
			argument0.pt1_posx[headseg] = 0;
			argument0.pt1_posy[headseg] = 0;
			argument0.pt2_posx[headseg] = 0;
			argument0.pt2_posy[headseg] = 0;
			headseg = (headseg + 1) % totalnumsegs;
			argument0.posx[headseg] = argument1;
			argument0.posy[headseg] = argument2;
			argument0.frame[headseg] = frame;
			argument0.pt1_posx[headseg] = 0;
			argument0.pt1_posy[headseg] = 0;
			argument0.pt2_posx[headseg] = 0;
			argument0.pt2_posy[headseg] = 0;
			headseg = (headseg + 1) % totalnumsegs;
			argument0.head_segment = headseg;
			argument0.num_segs = 2;
		}
		else
		{
			var headseg = (argument0.head_segment + (totalnumsegs - 1)) % totalnumsegs;
			argument0.posx[headseg] = argument1;
			argument0.posy[headseg] = argument2;
			argument0.frame[headseg] = frame;
			totalnumsegs = argument0.total_num_segs;
			var sqlength = 0;
			var prevseg = (headseg + (totalnumsegs - 1)) % totalnumsegs;
			var diffx = argument1 - argument0.posx[prevseg];
			var diffy = argument2 - argument0.posy[prevseg];
			sqlength = (diffx * diffx) + (diffy * diffy);
			var perpvecx, perpvecy;
			
			if (sqlength > 0)
			{
				var length = sqrt(sqlength);
				perpvecx = -(diffy / length) * argument0.halfwidth;
				perpvecy = (diffx / length) * argument0.halfwidth;
			}
			else
			{
				perpvecx = argument0.halfwidth;
				perpvecy = 0;
			}
			
			var pt1_posx = argument1 - perpvecx;
			var pt1_posy = argument2 - perpvecy;
			var pt2_posx = argument1 + perpvecx;
			var pt2_posy = argument2 + perpvecy;
			argument0.pt1_posx[headseg] = pt1_posx;
			argument0.pt1_posy[headseg] = pt1_posy;
			argument0.pt2_posx[headseg] = pt2_posx;
			argument0.pt2_posy[headseg] = pt2_posy;
			
			if (argument0.num_segs == 2)
			{
				argument0.pt1_posx[prevseg] = argument0.posx[prevseg] - perpvecx;
				argument0.pt1_posy[prevseg] = argument0.posy[prevseg] - perpvecy;
				argument0.pt2_posx[prevseg] = argument0.posx[prevseg] + perpvecx;
				argument0.pt2_posy[prevseg] = argument0.posy[prevseg] + perpvecy;
			}
			
			if (sqlength >= trail_min_segment_length_sq)
			{
				var currheadseg = argument0.head_segment;
				argument0.posx[currheadseg] = argument1;
				argument0.posy[currheadseg] = argument2;
				argument0.frame[currheadseg] = frame;
				argument0.pt1_posx[currheadseg] = pt1_posx;
				argument0.pt1_posy[currheadseg] = pt1_posy;
				argument0.pt2_posx[currheadseg] = pt2_posx;
				argument0.pt2_posy[currheadseg] = pt2_posy;
				var nextheadseg = (currheadseg + 1) % totalnumsegs;
				argument0.head_segment = nextheadseg;
				
				if (nextheadseg == argument0.tail_segment)
					argument0.tail_segment = (argument0.tail_segment + 1) % totalnumsegs;
				else
					argument0.num_segs++;
			}
		}
	};
	
	update_trails = function()
	{
		var i = 0;
		
		while (i < num_trails)
		{
			var trail = trails[i];
			var oldestvalidframe = frame - trail.lifetime;
			var totalnumsegs = trail.total_num_segs;
			var trailseg = trail.tail_segment;
			
			if (trail.head_segment == trailseg)
			{
				trails[i] = trails[num_trails - 1];
				num_trails--;
			}
			else
			{
				var nexttrailseg = (trailseg + 1) % totalnumsegs;
				
				while (trail.head_segment != nexttrailseg && trail.frame[nexttrailseg] < oldestvalidframe)
				{
					trailseg = nexttrailseg;
					nexttrailseg = (nexttrailseg + 1) % totalnumsegs;
					trail.num_segs--;
				}
				
				var latesttrailseg = (trail.head_segment + (totalnumsegs - 1)) % totalnumsegs;
				
				if (trail.frame[latesttrailseg] < oldestvalidframe)
				{
					trails[i] = trails[num_trails - 1];
					num_trails--;
				}
				else
				{
					trail.tail_segment = trailseg;
					i++;
				}
			}
		}
	};
	
	draw_trails = function()
	{
		gpu_set_blendmode_ext(param_trail_src_blend, param_trail_dest_blend);
		
		for (var i = 0; i < num_trails; i++)
		{
			var trail = trails[i];
			var totalnumsegs = trail.total_num_segs;
			
			if (trail.num_segs < 2)
				continue;
			
			var oldestvalidframe = trail.lifetime + frame;
			var cols = trail.cols;
			var alphas = trail.alphas;
			var alphascale = trail.alphascale;
			var lifetime = trail.lifetime;
			
			if (trails_use_trilists)
			{
				draw_primitive_begin(pr_trianglelist);
				var trailseg = trail.tail_segment;
				var headseg = trail.head_segment;
				var col = cols[3];
				var last_pt1_posx = trail.pt1_posx[trailseg];
				var last_pt1_posy = trail.pt1_posy[trailseg];
				var last_pt2_posx = trail.pt2_posx[trailseg];
				var last_pt2_posy = trail.pt2_posy[trailseg];
				var lastcol = col;
				var lastalpha = alphas[3];
				var lifeprop = (frame - trail.frame[trailseg]) / lifetime;
				lifeprop = clamp(lifeprop, 0, 1);
				var colprop = lifeprop;
				var colzone = 0;
				
				for (colprop -= trail_col_dist[0]; colprop > 0 && colzone < 2; colprop -= trail_col_dist[colzone])
					colzone++;
				
				var col_dist = trail_col_dist[colzone];
				
				if (col_dist <= 0)
					colprop = 0;
				else
					colprop = (lifeprop - trail_col_pos[colzone]) / col_dist;
				
				lastcol = merge_colour(cols[colzone], cols[colzone + 1], colprop);
				lastalpha = lerp(alphas[colzone], alphas[colzone + 1], colprop) * alphascale;
				trailseg = (trailseg + 1) % totalnumsegs;
				
				while (headseg != trailseg)
				{
					lifeprop = (frame - trail.frame[trailseg]) / lifetime;
					lifeprop = clamp(lifeprop, 0, 1);
					colprop = lifeprop;
					colzone = 0;
					
					for (colprop -= trail_col_dist[0]; colprop > 0 && colzone < 2; colprop -= trail_col_dist[colzone])
						colzone++;
					
					col_dist = trail_col_dist[colzone];
					
					if (col_dist <= 0)
						colprop = 0;
					else
						colprop = (lifeprop - trail_col_pos[colzone]) / col_dist;
					
					col = merge_colour(cols[colzone], cols[colzone + 1], colprop);
					var alpha = lerp(alphas[colzone], alphas[colzone + 1], colprop) * alphascale;
					draw_vertex_colour(last_pt1_posx, last_pt1_posy, lastcol, lastalpha);
					draw_vertex_colour(last_pt2_posx, last_pt2_posy, lastcol, lastalpha);
					draw_vertex_colour(trail.pt1_posx[trailseg], trail.pt1_posy[trailseg], col, alpha);
					draw_vertex_colour(trail.pt1_posx[trailseg], trail.pt1_posy[trailseg], col, alpha);
					draw_vertex_colour(last_pt2_posx, last_pt2_posy, lastcol, lastalpha);
					draw_vertex_colour(trail.pt2_posx[trailseg], trail.pt2_posy[trailseg], col, alpha);
					last_pt1_posx = trail.pt1_posx[trailseg];
					last_pt1_posy = trail.pt1_posy[trailseg];
					last_pt2_posx = trail.pt2_posx[trailseg];
					last_pt2_posy = trail.pt2_posy[trailseg];
					lastcol = col;
					lastalpha = alpha;
					trailseg = (trailseg + 1) % totalnumsegs;
				}
				
				draw_primitive_end();
			}
			else
			{
				draw_primitive_begin(pr_trianglestrip);
				var trailseg = trail.tail_segment;
				var headseg = trail.head_segment;
				
				while (headseg != trailseg)
				{
					var lifeprop = (frame - trail.frame[trailseg]) / lifetime;
					lifeprop = clamp(lifeprop, 0, 1);
					var colprop = lifeprop;
					var colzone = 0;
					
					for (colprop -= trail_col_dist[0]; colprop > 0 && colzone < 2; colprop -= trail_col_dist[colzone])
						colzone++;
					
					var col_dist = trail_col_dist[colzone];
					
					if (col_dist <= 0)
						colprop = 0;
					else
						colprop = (lifeprop - trail_col_pos[colzone]) / col_dist;
					
					var col = merge_colour(cols[colzone], cols[colzone + 1], colprop);
					var alpha = lerp(alphas[colzone], alphas[colzone + 1], colprop) * alphascale;
					draw_vertex_colour(trail.pt1_posx[trailseg], trail.pt1_posy[trailseg], col, alpha);
					draw_vertex_colour(trail.pt2_posx[trailseg], trail.pt2_posy[trailseg], col, alpha);
					trailseg = (trailseg + 1) % totalnumsegs;
				}
				
				draw_primitive_end();
			}
		}
	};
	
	setup_particle = function(argument0, argument1, argument2, argument3, argument4, argument5, argument6, argument7, argument8, argument9, argument10)
	{
		var particle = 
		{
			velx: random_range(param_particle_initial_velocity_range_x_min, param_particle_initial_velocity_range_x_max),
			vely: random_range(param_particle_initial_velocity_range_y_min, param_particle_initial_velocity_range_y_max),
			rot: random_range(param_particle_initial_rotation_min, param_particle_initial_rotation_max),
			rotspeed: random_range(param_particle_rot_speed_min, param_particle_rot_speed_max),
			subimage: irandom_range(0, sprite_get_number(param_sprite) - 1),
			mass: max(random_range(param_particle_mass_min, param_particle_mass_max), 0.00001),
			lifetime: random_range(param_particle_lifetime_min, param_particle_lifetime_max) * argument9,
			spawnframe: frame
		};
		
		if (argument10)
		{
			particle.posx = random_range(argument0, argument1);
			particle.posy = random_range(argument2, argument3);
			particle.lastposx = particle.posx;
			particle.lastposy = particle.posy;
		}
		else
		{
			var zonerand = random_range(0, 0.9999);
			var zone = 0;
			
			for (zonerand -= argument4[zone]; zonerand > 0 && zone < 7; zonerand -= argument4[zone])
				zone++;
			
			particle.posx = random_range(argument0[zone], argument1[zone]);
			particle.posy = random_range(argument2[zone], argument3[zone]);
			particle.lastposx = particle.posx;
			particle.lastposy = particle.posy;
			var view_rel_velx = particle.velx - argument7;
			var view_rel_vely = particle.vely - argument8;
			
			if (((particle.posx - argument1[0]) < 0 && view_rel_velx < 0) || ((particle.posx - argument0[2]) > 0 && view_rel_velx > 0))
				particle.posx = argument5 + (argument5 - particle.posx);
			
			if (((particle.posy - argument3[0]) < 0 && view_rel_vely < 0) || ((particle.posy - argument2[5]) > 0 && view_rel_vely > 0))
				particle.posy = argument6 + (argument6 - particle.posy);
		}
		
		var colblend = random_range(0, 1);
		particle.cols = array_create(4);
		particle.alphas = array_create(4);
		particle.cols[0] = merge_colour(particle_col[0], particle_col_alt[0], colblend);
		particle.cols[1] = merge_colour(particle_col[1], particle_col_alt[1], colblend);
		particle.cols[2] = merge_colour(particle_col[2], particle_col_alt[2], colblend);
		particle.cols[3] = merge_colour(particle_col[3], particle_col_alt[3], colblend);
		particle.alphas[0] = lerp(particle_alpha[0], particle_alpha_alt[0], colblend);
		particle.alphas[1] = lerp(particle_alpha[1], particle_alpha_alt[1], colblend);
		particle.alphas[2] = lerp(particle_alpha[2], particle_alpha_alt[2], colblend);
		particle.alphas[3] = lerp(particle_alpha[3], particle_alpha_alt[3], colblend);
		
		if (random(100) < param_trail_chance)
		{
			var spritesize = min(sprwidth, sprheight) * particle.mass * param_particle_start_sprite_scale * particle_scale_compensation;
			particle.trail = spawn_trail(random_range(param_trail_lifetime_min, param_trail_lifetime_max), spritesize);
			add_trail_segment(particle.trail, particle.posx, particle.posy);
		}
		else
		{
			particle.trail = undefined;
		}
		
		return particle;
	};
	
	draw_particles = function()
	{
		gpu_set_blendmode_ext(param_particle_src_blend, param_particle_dest_blend);
		
		for (var i = 0; i < num_particles; i++)
		{
			var particle = particles[i];
			var lifeprop = (frame - particle.spawnframe) / particle.lifetime;
			lifeprop = clamp(lifeprop, 0, 1);
			var colprop = lifeprop;
			var colzone = 0;
			
			for (colprop -= particle_col_dist[0]; colprop > 0 && colzone < 2; colprop -= particle_col_dist[colzone])
				colzone++;
			
			var col_dist = particle_col_dist[colzone];
			
			if (col_dist <= 0)
				colprop = 0;
			else
				colprop = (lifeprop - particle_col_pos[colzone]) / col_dist;
			
			var cols = particle.cols;
			var alphas = particle.alphas;
			var spritecol = merge_colour(cols[colzone], cols[colzone + 1], colprop);
			var spritealpha = lerp(alphas[colzone], alphas[colzone + 1], colprop);
			
			if (particle.trail != undefined)
				particle.trail.alphascale = spritealpha;
			
			if (param_trails_only == 0)
			{
				var rot = 0;
				
				if (param_particle_align_vel > 0 && particle.lastposx != particle.posx && particle.lastposy != particle.posy)
				{
					var diffx = particle.posx - particle.lastposx;
					var diffy = particle.posy - particle.lastposy;
					var length = sqrt((diffx * diffx) + (diffy * diffy));
					diffy /= length;
					rot = (arccos(-diffy) / pi) * 180;
					
					if (diffx > 0)
						rot = -rot;
				}
				
				var spritescale = particle.mass * particle_scale_compensation * lerp(param_particle_start_sprite_scale, param_particle_end_sprite_scale, lifeprop);
				draw_sprite_ext(param_sprite, particle.subimage, particle.posx, particle.posy, spritescale, spritescale, particle.rot + rot, spritecol, spritealpha);
			}
		}
	};
	
	step = function()
	{
		var gamespeed = game_get_speed(gamespeed_fps);
		var timedelta = 1 / gamespeed;
		update_colours();
		var minx = 0;
		var maxx = 0;
		var miny = 0;
		var maxy = 0;
		
		if (view_enabled)
		{
			var first = true;
			
			for (i = 0; i < 8; i++)
			{
				if (view_visible[i])
				{
					var cam = view_camera[i];
					var cam_minx = camera_get_view_x(cam);
					var cam_miny = camera_get_view_y(cam);
					var cam_maxx = cam_minx + camera_get_view_width(cam);
					var cam_maxy = cam_miny + camera_get_view_height(cam);
					
					if (first)
					{
						first = false;
						minx = cam_minx;
						miny = cam_miny;
						maxx = cam_maxx;
						maxy = cam_maxy;
					}
					else
					{
						minx = min(minx, cam_minx);
						miny = min(miny, cam_miny);
						maxx = max(maxx, cam_maxx);
						maxy = max(maxy, cam_maxy);
					}
				}
			}
		}
		else
		{
			minx = 0;
			miny = 0;
			maxx = room_width;
			maxy = room_height;
		}
		
		var centrex = (minx + maxx) / 2;
		var centrey = (miny + maxy) / 2;
		views_minx = minx;
		views_maxx = maxx;
		views_miny = miny;
		views_maxy = maxy;
		views_centrex = centrex;
		views_centrey = centrey;
		
		if (frame == 0)
		{
			last_view_centrex = centrex;
			last_view_centrey = centrey;
		}
		
		var view_velx = centrex - last_view_centrex;
		var view_vely = centrey - last_view_centrey;
		
		if (timedelta != 0)
		{
			view_velx /= timedelta;
			view_vely /= timedelta;
		}
		
		last_view_centrex = centrex;
		last_view_centrey = centrey;
		var floored_param_force_grid_size_x = floor(param_force_grid_sizex);
		var floored_param_force_grid_size_y = floor(param_force_grid_sizey);
		var cellsizex = (maxx - minx) / (floored_param_force_grid_size_x - (grid_margin * 2));
		var cellsizey = (maxy - miny) / (floored_param_force_grid_size_y - (grid_margin * 2));
		
		if (force_grid_sizex != floored_param_force_grid_size_x || force_grid_sizey != floored_param_force_grid_size_y)
		{
			force_grid_sizex = floored_param_force_grid_size_x;
			force_grid_sizey = floored_param_force_grid_size_y;
			force_grid = array_create(force_grid_sizey * force_grid_sizex * 2);
			force_grid_centrex = centrex;
			force_grid_centrey = centrey;
		}
		
		var celldiffx = floor((centrex - force_grid_centrex) / cellsizex);
		var celldiffy = floor((centrey - force_grid_centrey) / cellsizey);
		
		if (celldiffx > 0)
		{
			force_grid_offsetx += celldiffx;
			force_grid_offsetx %= force_grid_sizex;
			force_grid_centrex += (celldiffx * cellsizex);
		}
		else if (celldiffx < 0)
		{
			var celldiff = -celldiffx;
			celldiff = celldiff % force_grid_sizex;
			force_grid_offsetx += (force_grid_sizex - celldiff);
			force_grid_offsetx %= force_grid_sizex;
			force_grid_centrex += (celldiffx * cellsizex);
		}
		
		if (celldiffy > 0)
		{
			force_grid_offsety += celldiffy;
			force_grid_offsety %= force_grid_sizey;
			force_grid_centrey += (celldiffy * cellsizey);
		}
		else if (celldiffy < 0)
		{
			var celldiff = -celldiffy;
			celldiff = celldiff % force_grid_sizey;
			force_grid_offsety += (force_grid_sizey - celldiff);
			force_grid_offsety %= force_grid_sizey;
			force_grid_centrey += (celldiffy * cellsizey);
		}
		
		var grid_basex = force_grid_centrex - (force_grid_sizex * cellsizex * 0.5);
		var grid_basey = force_grid_centrey - (force_grid_sizey * cellsizey * 0.5);
		var floored_param_num_blowers = floor(param_num_blowers);
		
		if (num_blowers < floored_param_num_blowers)
		{
			if (array_length(blowers) < floored_param_num_blowers)
				array_resize(blowers, floored_param_num_blowers);
			
			for (i = num_blowers; i < floored_param_num_blowers; i++)
				blowers[i] = spawn_blower(minx, maxx, miny, maxy);
			
			num_blowers = floored_param_num_blowers;
		}
		
		var i = 0;
		
		while (i < num_blowers)
		{
			var blower = blowers[i];
			blower.posx += (blower.velx - (view_velx * param_blower_camvec_scale)) * timedelta;
			blower.rot += blower.rotspeed * timedelta;
			var respawn = false;
			
			if ((blower.velx < 0 && (blower.posx + blower.size) < minx) || (blower.velx > 0 && (blower.posx - blower.size) > maxx) || (blower.posy + blower.size) < miny || (blower.posy - blower.size) > maxy)
				respawn = true;
			
			if (respawn && num_blowers > floored_param_num_blowers)
			{
				blowers[i] = blowers[num_blowers - 1];
				num_blowers--;
			}
			else if (respawn)
			{
				blowers[i] = spawn_blower(minx, maxx, miny, maxy);
				i++;
			}
			else
			{
				i++;
			}
		}
		
		for (i = 0; i < num_blowers; i++)
		{
			var blower = blowers[i];
			blower.vecx = sin(blower.rot) * blower.force;
			blower.vecy = cos(blower.rot) * blower.force;
		}
		
		i = force_grid_sizey - 1;
		
		while (i >= 0)
		{
			var gridy = (i + force_grid_offsety) % force_grid_sizey;
			var gridposy = grid_basey + (i * cellsizey);
			
			for (var j = 0; j < force_grid_sizex; j++)
			{
				var gridx = (j + force_grid_offsetx) % force_grid_sizex;
				var gridposx = grid_basex + (j * cellsizex);
				var vecx = param_wind_vector_x;
				var vecy = param_wind_vector_y;
				
				for (var k = 0; k < num_blowers; k++)
				{
					var blower = blowers[k];
					var diffx = blower.posx - gridposx;
					var diffy = blower.posy - gridposy;
					var sqdist = (diffx * diffx) + (diffy * diffy);
					var blowersize = blower.size;
					
					if (sqdist < (blowersize * blowersize))
					{
						var dist = sqrt(sqdist);
						var weight = 1 - (dist / blowersize);
						vecx += (blower.vecx * weight);
						vecy += (blower.vecy * weight);
					}
				}
				
				var index = ((gridy * force_grid_sizex) + gridx) * 2;
				force_grid[index] = vecx;
				force_grid[index + 1] = vecy;
			}
			
			i--;
		}
		
		trail_min_segment_length_sq = param_trail_min_segment_length * param_trail_min_segment_length;
		sprwidth = sprite_get_width(param_sprite);
		sprheight = sprite_get_height(param_sprite);
		var max_mass = max(param_particle_mass_min, param_particle_mass_max);
		
		if (max_mass != 0)
			particle_scale_compensation = 1 / max_mass;
		else
			particle_scale_compensation = 1;
		
		var sprsize = max(sprwidth, sprheight) * max(param_particle_start_sprite_scale, param_particle_end_sprite_scale);
		var border_prop = max(0.001, param_particle_spawn_border_prop);
		var spawnxmargin = (maxx - minx) * border_prop;
		var spawnymargin = (maxy - miny) * border_prop;
		var os_spawnboundsx = [minx - spawnxmargin - sprsize, minx - sprsize, maxx + sprsize, maxx + spawnxmargin + sprsize];
		var os_spawnboundsy = [miny - spawnymargin - sprsize, miny - sprsize, maxy + sprsize, maxy + spawnymargin + sprsize];
		var os_spawnxmin = [os_spawnboundsx[0], os_spawnboundsx[1], os_spawnboundsx[2], os_spawnboundsx[0], os_spawnboundsx[2], os_spawnboundsx[0], os_spawnboundsx[1], os_spawnboundsx[2]];
		var os_spawnxmax = [os_spawnboundsx[1], os_spawnboundsx[2], os_spawnboundsx[3], os_spawnboundsx[1], os_spawnboundsx[3], os_spawnboundsx[1], os_spawnboundsx[2], os_spawnboundsx[3]];
		var os_spawnymin = [os_spawnboundsy[0], os_spawnboundsy[0], os_spawnboundsy[0], os_spawnboundsy[1], os_spawnboundsy[1], os_spawnboundsy[2], os_spawnboundsy[2], os_spawnboundsy[2]];
		var os_spawnymax = [os_spawnboundsy[1], os_spawnboundsy[1], os_spawnboundsy[1], os_spawnboundsy[2], os_spawnboundsy[2], os_spawnboundsy[3], os_spawnboundsy[3], os_spawnboundsy[3]];
		var os_spawnweights = [];
		var os_weighttotal = 0;
		
		for (i = 0; i < 7; i++)
		{
			os_spawnweights[i] = (os_spawnxmax[i] - os_spawnxmin[i]) * (os_spawnymax[i] - os_spawnymin[i]);
			os_weighttotal += os_spawnweights[i];
		}
		
		for (i = 0; i < 7; i++)
			os_spawnweights[i] /= os_weighttotal;
		
		do
		{
			update_trails();
			var spawn_all_now, spawnxmin, spawnxmax, spawnymin, spawnymax, spawnweights, spawn_in_one_zone;
			
			if (frame == 0 && param_particle_spawn_all_at_start != 0)
			{
				spawnxmin = minx - spawnxmargin - sprsize;
				spawnxmax = maxx + spawnxmargin + sprsize;
				spawnymin = miny - spawnymargin - sprsize;
				spawnymax = maxy + spawnymargin + sprsize;
				spawnweights = 0;
				spawn_all_now = true;
				spawn_in_one_zone = true;
			}
			else
			{
				spawnxmin = os_spawnxmin;
				spawnxmax = os_spawnxmax;
				spawnymin = os_spawnymin;
				spawnymax = os_spawnymax;
				spawnweights = os_spawnweights;
				spawn_all_now = false;
				spawn_in_one_zone = false;
			}
			
			var floored_param_num_particles = floor(param_num_particles);
			
			if (num_particles < floored_param_num_particles)
			{
				var new_num_particles = floored_param_num_particles;
				
				if (param_particle_spawn_time > 0 && spawn_all_now == false)
				{
					time_since_last_particle += timedelta;
					var spawn_time_seconds = param_particle_spawn_time / 1000;
					new_num_particles = min(new_num_particles, num_particles + floor(time_since_last_particle / spawn_time_seconds));
					time_since_last_particle %= spawn_time_seconds;
				}
				
				if (array_length(particles) < new_num_particles)
					array_resize(particles, new_num_particles);
				
				for (i = num_particles; i < new_num_particles; i++)
					particles[i] = setup_particle(spawnxmin, spawnxmax, spawnymin, spawnymax, spawnweights, centrex, centrey, view_velx, view_vely, gamespeed, spawn_in_one_zone);
				
				num_particles = new_num_particles;
			}
			
			var dragcoeffs = air_density * param_dragcoeff * 0.5;
			var update_skip = floor(param_particle_update_skip + 1);
			
			for (i = 0; i < num_particles; 
			{
			})
			{
				var respawn = false;
				var particle = particles[i];
				
				if ((particle.spawnframe + particle.lifetime) <= frame)
					respawn = true;
				
				if (!respawn)
				{
					if (((frame + i) % update_skip) != 0)
					{
						particle.lastposx = particle.posx;
						particle.lastposy = particle.posy;
						particle.posx += particle.velx * timedelta;
						particle.posy += particle.vely * timedelta;
						
						if (particle.trail != undefined)
							add_trail_segment(particle.trail, particle.posx, particle.posy);
						
						particle.rot += particle.rotspeed * timedelta;
						i++;
						continue;
					}
					
					var gridx = (particle.posx - grid_basex) / cellsizex;
					var gridy = (particle.posy - grid_basey) / cellsizey;
					var blendx = frac(gridx);
					var blendy = frac(gridy);
					gridx = floor(gridx);
					gridy = floor(gridy);
					gridx = (gridx + force_grid_offsetx) % force_grid_sizex;
					gridy = (gridy + force_grid_offsety) % force_grid_sizey;
					
					if (gridx < 0)
						gridx = force_grid_sizex + gridx;
					
					if (gridy < 0)
						gridy = force_grid_sizey + gridy;
					
					var gridtempx1 = gridx;
					var gridtempx2 = (gridx + 1) % force_grid_sizex;
					var gridtempy1 = gridy * force_grid_sizex;
					var gridtempy2 = ((gridy + 1) % force_grid_sizey) * force_grid_sizex;
					var index1 = (gridtempy1 + gridtempx1) * 2;
					var index2 = (gridtempy1 + gridtempx2) * 2;
					var index3 = (gridtempy2 + gridtempx1) * 2;
					var index4 = (gridtempy2 + gridtempx2) * 2;
					var force1x = force_grid[index1];
					var force1y = force_grid[index1 + 1];
					var force2x = force_grid[index2];
					var force2y = force_grid[index2 + 1];
					var force3x = force_grid[index3];
					var force3y = force_grid[index3 + 1];
					var force4x = force_grid[index4];
					var force4y = force_grid[index4 + 1];
					var topval = ((force2x - force1x) * blendx) + force1x;
					var bottomval = ((force4x - force3x) * blendx) + force3x;
					var gridforcex = ((bottomval - topval) * blendy) + topval;
					topval = ((force2y - force1y) * blendx) + force1y;
					bottomval = ((force4y - force3y) * blendx) + force3y;
					var gridforcey = ((bottomval - topval) * blendy) + topval;
					var thisparticlemass = particle.mass;
					var particle_velx = particle.velx;
					var particle_vely = particle.vely;
					particle_velx += ((gridforcex / thisparticlemass) * timedelta);
					particle_vely += ((gridforcey / thisparticlemass) * timedelta);
					particle_vely += (param_grav_accel * timedelta);
					var forcex = dragcoeffs * particle.mass * (particle_velx * particle_velx);
					var forcey = dragcoeffs * particle.mass * (particle_vely * particle_vely);
					
					if (particle_velx > 0)
						forcex = -forcex;
					
					if (particle_vely > 0)
						forcey = -forcey;
					
					particle_velx += ((forcex / thisparticlemass) * timedelta);
					particle_vely += ((forcey / thisparticlemass) * timedelta);
					particle.velx = particle_velx;
					particle.vely = particle_vely;
					particle.lastposx = particle.posx;
					particle.lastposy = particle.posy;
					particle.posx += particle_velx * timedelta;
					particle.posy += particle_vely * timedelta;
					var view_rel_velx = particle_velx - view_velx;
					var view_rel_vely = particle_vely - view_vely;
					
					if ((view_rel_velx < 0 && (particle.posx + sprsize) < minx) || (view_rel_velx > 0 && (particle.posx - sprsize) > maxx) || (view_rel_vely < 0 && (particle.posy + sprsize) < miny) || (view_rel_vely > 0 && (particle.posy - sprsize) > maxy))
						respawn = true;
				}
				
				if (respawn && num_particles > floored_param_num_particles)
				{
					particles[i] = particles[num_particles - 1];
					num_particles--;
				}
				else if (respawn)
				{
					particles[i] = setup_particle(spawnxmin, spawnxmax, spawnymin, spawnymax, spawnweights, centrex, centrey, view_velx, view_vely, gamespeed, spawn_in_one_zone);
					i++;
				}
				else
				{
					if (particle.trail != undefined)
						add_trail_segment(particle.trail, particle.posx, particle.posy);
					
					particle.rot += particle.rotspeed * timedelta;
					i++;
				}
			}
			
			frame++;
		}
		until (frame > param_warmup_frames);
	};
	
	room_start = function()
	{
	};
	
	room_end = function()
	{
		reset();
	};
	
	layer_begin = function()
	{
	};
	
	layer_end = function()
	{
		if (event_type != ev_draw || event_number != 0)
			exit;
		
		gpu_push_state();
		var oldcol = draw_get_colour();
		var oldalpha = draw_get_alpha();
		draw_trails();
		draw_particles();
		
		if (param_debug_grid > 0)
		{
			draw_set_colour(c_white);
			draw_set_alpha(debug_grid_alpha);
			var cellsizex = (views_maxx - views_minx) / (force_grid_sizex - (grid_margin * 2));
			var cellsizey = (views_maxy - views_miny) / (force_grid_sizey - (grid_margin * 2));
			var grid_basex = force_grid_centrex - (force_grid_sizex * cellsizex * 0.5);
			var grid_basey = force_grid_centrey - (force_grid_sizey * cellsizey * 0.5);
			
			for (var i = 0; i < force_grid_sizey; i++)
			{
				for (var j = 0; j < force_grid_sizex; j++)
				{
					var gridx = (j + force_grid_offsetx) % force_grid_sizex;
					var gridy = (i + force_grid_offsety) % force_grid_sizey;
					var index = ((gridy * force_grid_sizex) + gridx) * 2;
					var forcevecx = force_grid[index];
					var forcevecy = force_grid[index + 1];
					forcevecx *= debug_force_scale;
					forcevecy *= debug_force_scale;
					var startx = (grid_basex + (cellsizex * (j + 0.5))) - (forcevecx * 0.5);
					var starty = (grid_basey + (cellsizey * (i + 0.5))) - (forcevecy * 0.5);
					draw_arrow(startx, starty, startx + forcevecx, starty + forcevecy, 10);
				}
			}
			
			if (param_debug_grid > 1)
			{
				draw_set_colour(c_yellow);
				
				for (var i = 0; i < num_blowers; i++)
				{
					draw_circle(blowers[i].posx, blowers[i].posy, blowers[i].size, true);
					var halfforcevecx = blowers[i].vecx * debug_force_scale * 0.5;
					var halfforcevecy = blowers[i].vecy * debug_force_scale * 0.5;
					draw_arrow(blowers[i].posx - halfforcevecx, blowers[i].posy - halfforcevecy, blowers[i].posx + halfforcevecx, blowers[i].posy + halfforcevecy, 10);
				}
			}
		}
		
		draw_set_colour(oldcol);
		draw_set_alpha(oldalpha);
		gpu_pop_state();
	};
	
	reset();
}
