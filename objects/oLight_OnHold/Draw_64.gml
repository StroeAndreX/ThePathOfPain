///*var c_PathGray = make_color_rgb(34,33,38);

///*
//gpu_set_blendmode(bm_add);
//draw_set_alpha(0.1);
//draw_circle_color(global.camera_xview/2 ,global.camera_yview/2,1000*1.1,c_white,c_black,false);
//draw_set_alpha(1);
////draw_circle_color(global.camera_xport + (global.camera_xview/2),global.camera_yport + (global.camera_yview/2),circle,c_orange,c_black,true);
//gpu_set_blendmode(bm_normal);

//*/
//if(room != rEyes)
//{		
//	gpu_set_blendmode(bm_subtract)
//	draw_circle_color(global.camera_xview/2 ,global.camera_yview/2,1050*rg,c_black,c_white ,false);
//	//draw_circle_color(global.camera_xport + (global.camera_xview/2),global.camera_yport + (global.camera_yview/2),circle,c_orange,c_black,true);
//	gpu_set_blendmode(bm_normal);
	
//	/// ---> Fill the room with a black box, for just a few seconds
//	if(instance_exists(oTraumaEffect))
//	{
//		if(oTraumaEffect.drawBlackBlock) 
//		{
//		//
//		}
//	}	
	
//}
//else if(room == rEyes) 
//{
//	gpu_set_blendmode(bm_subtract)
//	draw_circle_color(global.camera_xview/2 ,global.camera_yview/2,900-dp,c_black,c_white ,false);
//	//draw_circle_color(global.camera_xport + (global.camera_xview/2),global.camera_yport + (global.camera_yview/2),circle,c_orange,c_black,true);
//	gpu_set_blendmode(bm_normal);
//} 

///*
//gpu_set_blendmode(bm_add)
//draw_set_alpha(0.1);
//draw_circle_color(global.camera_xview/2 ,global.camera_yview/2,3000*rg,c_black,c_white ,false);
////draw_circle_color(global.camera_xport + (global.camera_xview/2),global.camera_yport + (global.camera_yview/2),circle,c_orange,c_black,true);
//draw_set_alpha(1);
//gpu_set_blendmode(bm_normal);

///*
//gpu_set_blendmode(bm_add); //Probably gonna working on
////draw_circle_color(global.camera_xview/2 ,global.camera_yview/2,1000*1.1,c_orange,c_white,false);
//draw_set_alpha(0.05);
//draw_circle_color(oPlayer.x ,oPlayer.y,300*1.1,c_white,c_black,false);
//draw_set_alpha(1);
//gpu_set_blendmode(bm_normal);

draw_sprite(sLightningShader,-1,0,0);



