# Pedigraph-Script

### About the Script
This script uses the free-to-use pedigree generating software Pedigraph to automate the generation of multiple pedigrees. The download for Pedigraph can be found [here](https://animalgene.umn.edu/download-pedigraph). The script also requires **sed** for Windows, which can be found [here](http://gnuwin32.sourceforge.net/packages/sed.htm).

The script was written for a small project at Auburn University in Dr. Laurie Stevison's lab. In an Excel sheet we received hundreds of IDs of multiple macaques. The job was to find out who is related to who and separate individuals into families; luckily pedigree building software exists, so creating pedigrees slowly by hand was not required. The tedium of renaming the output file of multiple families is removed by this script, as well.

The script can be found in the folder **Example Files**. It is set up to run for the examples, but it can be modified to fit different needs. 

### How Pedigraph Works

Pedigraph must be run in the command line with the command **pedigraph [input file]**. The script will run this itself and is not required unless you want to run Pedigraph on a single file.

Plain text files are required as input for Pedigraph. A minimum of four columns are required for Pedigraph to run:
1. Individual ID
2. Parent 1 ID (0 is unknown parent)
3. Parent 2 ID (0 is unknown parent)
4. Gender code (default is M/F)

Other columns may be added and will not affect Pedigraph. More on how Pedigraph works can be found in the manual [here](https://animalgene.umn.edu/sites/animalgene.umn.edu/files/pedigraph_manual.pdf). Changes can be made to the file pedigraph.dat to customize Pedigraph's output. The script will only affect the parameter "outputfile."

When naming output files, the script looks for text files numbered in a sequential order, starting at and ending at two specified numbers. When organizing our Excel sheet, we separated individuals and their relatives into unrelated families, represented by a number and referred to as Family ID. Organizing the pedigrees in a numbered fashion proves to be very simple and is recommended. The script also looks for a certain amount of individuals present in the pedigree and chooses whether or not to generate output depending on if the condition is met. 

The most important error encountered is Pedigraph refusing to generate a pedigree and displaying
>ERROR: Due to a loop in the pedigree the inbreeding coefficients cannot be calculated

After much frustration this error was found to occur when the parents' IDs are of higher numerical value than the offspring or when numbers are not used as IDs. When creating a family be sure that the offspring has a higher ID than **both** parents. Confusingly the error does not apply to families where individuals have half siblings; as of what we know now it only applies to families with two parents and their offspring or one parent and their offspring.  

Another important point is that unless the parents are specified as individuals themselves, Pedigraph will not assign genders to the parents unless their gender is implied through another mating. The parent must have their Individual ID and gender listed, and the Parent 1 and 2 IDs must be 0.

### Examples

I have uploaded a few example files to show how the script functions, either correctly or incorrectly. Pedigraph and **sed** are required to run the script and must be in the same directory as the input files.

For each text file, the example script should do something different:
* For 1.txt, the file should have output.
* For 2.txt, no output should be generated as not enough individuals are present.
* For 3.txt, no output should be generated due to error explained earlier.
* For 4.txt, output will be generated and shows how even though the error should apply, it does not when half-siblings are present.
