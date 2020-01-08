**readme will be thoroughly documented in the future**

SPS30_test_analysis script was developed with the intention of analyzing the bahavior of SPS30 OPC units and how they may possibly calculate
data between bin sizes. The user has the option of calculating the ratios between bin calculations against pressure and estimated altitude (if
a vacuum chamber was used) or against time. Ideally this script could be used to analyze data from other OPCs as well.

The user must import a .csv file with relevant data into the working directory in order to run the script. The script outputs a .fig file with
all generated plots. Users should be careful to export said .fig and .csv files outside of the .git directory so as to notclutter the directory.

Future functionality will include...
1) Automatically converting the generated figures into .jpg images
2) Additional plots that will analyze data in innovative ways
