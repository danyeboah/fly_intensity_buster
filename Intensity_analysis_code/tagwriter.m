function tagwriter(id,geno,age,obj,flip,lo_number,hi_number,lo_arr,hi_arr,lo_gene,hi_gene,lo_flo,hi_flo,lo_PMT,hi_PMT,lo_frame,hi_frame,lo_suffix,hi_suffix)

% this function generates a tag file for use in intensity analysis
% it has a lot of input, but these input will be obtained from a gui.


filename = strcat(id,'.tag');
f = fopen(filename, 'wt');

% print first generic part
id_to_print = horzcat('id',' ',id);
geno_to_print = horzcat('geno',' ',geno);    %%%%%%%%%%%%%%% 
age_to_print = horzcat('age',' ',age);    %%%%%%%%%%%%%%%%%
obj_to_print = horzcat('obj',' ',obj);    %%%%%%%%%%%%%%%%
flip_to_print = horzcat('flip',' ',flip);

fprintf(f,id_to_print);
fprintf(f,'\n');

fprintf(f,geno_to_print);
fprintf(f,'\n');

fprintf(f,age_to_print);
fprintf(f,'\n');

fprintf(f,obj_to_print);
fprintf(f,'\n');

fprintf(f,flip_to_print);
fprintf(f,'\n');
fprintf(f,'\n');

% print info relating to lo_power data
fprintf(f,lo_number);
fprintf(f,'\n');

loarr_to_print = horzcat('arr',' ',lo_arr);
logene_to_print = horzcat('gene',' ',lo_gene);
lofluo_to_print = horzcat('fluorophore',' ',lo_flo);
loPMT_to_print = horzcat('PMT',' ',lo_PMT);
loframe_to_print = horzcat('frames',' ',lo_frame);
losuffix_to_print = horzcat('suffix',' ',lo_suffix);

fprintf(f,loarr_to_print);
fprintf(f,'\n');

fprintf(f,logene_to_print);
fprintf(f,'\n');

fprintf(f,lofluo_to_print);
fprintf(f,'\n');

fprintf(f,loPMT_to_print);
fprintf(f,'\n');

fprintf(f,loframe_to_print);
fprintf(f,'\n');

fprintf(f,losuffix_to_print);
fprintf(f,'\n');
fprintf(f,'\n');


% print info relating to hi_power data
fprintf(f,hi_number);
fprintf(f,'\n');

hiarr_to_print = horzcat('arr',' ',hi_arr);
higene_to_print = horzcat('gene',' ',hi_gene);
hifluo_to_print = horzcat('fluorophore',' ',hi_flo);
hiPMT_to_print = horzcat('PMT',' ',hi_PMT);
hiframe_to_print = horzcat('frames',' ',hi_frame);
hisuffix_to_print = horzcat('suffix',' ',hi_suffix);

fprintf(f,hiarr_to_print);
fprintf(f,'\n');

fprintf(f,higene_to_print);
fprintf(f,'\n');

fprintf(f,hifluo_to_print);
fprintf(f,'\n');

fprintf(f,hiPMT_to_print);
fprintf(f,'\n');

fprintf(f,hiframe_to_print);
fprintf(f,'\n');

fprintf(f,hisuffix_to_print);










fclose(f);