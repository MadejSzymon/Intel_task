rm -rf output_data
mkdir -p output_data
make DBG_ALL=1 clean all run | tee output.log
egrep x_dbl output.log | cut -d'=' -f2 > ./output_data/x_dbl.dat
egrep x_fxd output.log | cut -d'=' -f2 > ./output_data/x_fxd.dat
egrep x1_int output.log | cut -d'=' -f2 > ./output_data/x1_int.dat
egrep x2_int output.log | cut -d'=' -f2 > ./output_data/x2_int.dat
egrep x1_fxd output.log | cut -d'=' -f2 > ./output_data/x1_fxd.dat
egrep x2_fxd output.log | cut -d'=' -f2 > ./output_data/x2_fxd.dat
egrep sq_fxd output.log | cut -d'=' -f2 > ./output_data/sq_fxd.dat
egrep index output.log | cut -d'=' -f2 > ./output_data/index.dat
egrep a_dbl output.log | cut -d'=' -f2 > ./output_data/a_dbl.dat
egrep a_fxd output.log | cut -d'=' -f2 > ./output_data/a_fxd.dat
egrep b_dbl output.log | cut -d'=' -f2 > ./output_data/b_dbl.dat
egrep b_fxd output.log | cut -d'=' -f2 > ./output_data/b_fxd.dat
egrep c_dbl output.log | cut -d'=' -f2 > ./output_data/c_dbl.dat
egrep c_fxd output.log | cut -d'=' -f2 > ./output_data/c_fxd.dat
egrep t0_fxd output.log | cut -d'=' -f2 > ./output_data/t0_fxd.dat
egrep t1_fxd output.log | cut -d'=' -f2 > ./output_data/t1_fxd.dat
egrep t2_fxd output.log | cut -d'=' -f2 > ./output_data/t2_fxd.dat
egrep s_fxd output.log | cut -d'=' -f2 > ./output_data/s_fxd.dat
egrep y_fxd output.log | cut -d'=' -f2 > ./output_data/y_fxd.dat
egrep y_dbl output.log | cut -d'=' -f2 > ./output_data/y_dbl.dat
egrep y_ref output.log | cut -d'=' -f2 > ./output_data/y_ref.dat
egrep y_err output.log | cut -d'=' -f2 > ./output_data/err.dat
