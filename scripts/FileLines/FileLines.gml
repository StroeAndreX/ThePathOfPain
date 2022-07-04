var file;
file = file_text_open_read(working_directory + "ids.txt");
var num = 0; while (!file_text_eoln(file))
   {
	   file_text_readln(file);
	   num++;
   }
file_text_close(file);

return num;

