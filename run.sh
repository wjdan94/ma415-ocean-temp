
# this script prepares the directory for data analysis
# It will do the following:
#  1- download all the data files from 2001 - 2016
#  2- creates a directory to save the cleaned data 
#  3- runs R script

START=$1
END=$2
SAVE_DIR_PATH="./"
SAVE_DIR_NAME_RDATA="cleaned_data_Rdata"
SAVE_DIR_NAME_XLSX="cleaned_data_xlsx"

#echo "Downloading all data between ${START} - ${END}"
#./scripts/download_all_data.sh $START $END

echo ""
echo "Creating a directory to save clean data"
eval "mkdir ${SAVE_DIR_NAME_XLSX}"
eval "mkdir ${cleaned_data_Rdata}"
echo "Clean data will be saved in ./${SAVE_DIR_NAME_XLSX} and ./${cleaned_data_Rdata}"
echo ""

cd ${SAVE_DIR_NAME_XLSX}
eval "rm *" 
cd ..

echo "Running R Script to clean downloaded data"
RUN_R="Rscript --vanilla ./cleaning_script.R ${START} ${END} ${SAVE_DIR_PATH} ${SAVE_DIR_NAME_RDATA} ${SAVE_DIR_NAME_XLSX}"
echo "${RUN_R}"

echo ""
eval $RUN_R

