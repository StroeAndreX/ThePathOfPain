if(instance_exists(o_key)){
  locked = 2;
} else if(instance_exists(o_boss)){ // or a bunch of other conditions...
  locked = 1;
} else {
  locked = 0;
}

image_index = locked;

