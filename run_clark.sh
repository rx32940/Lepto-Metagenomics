#!/bin/bash
#PBS -q batch
#PBS -N run_clark
#PBS -l nodes=1:ppn=2 -l mem=20gb
#PBS -l walltime=30:00:00
#PBS -M rx32940@uga.edu
#PBS -m abe
#PBS -o /scratch/rx32940/Metagenomic_taxon_profile
#PBS -e /scratch/rx32940/Metagenomic_taxon_profile
#PBS -j oe

# building Clark-s database

path="/scratch/rx32940"

# set up the database
$path/CLARK/CLARKSCV1.2.6.1/set_targets.sh $path/CLARK/DB bacteria viruses --species
$path/CLARK/CLARKSCV1.2.6.1/set_targets.sh $path/CLARK/DB bacteria viruses --genus
# database of discriminative 31-mers
$path/CLARK/CLARKSCV1.2.6.1/classify_metagenome.sh -P $path/CLARK/sample.L.txt $path/CLARK/sample.R.txt -R /scratch/rx32940/CLARK/output/result

# databases of discriminative spaced 31-mers
$path/CLARK/CLARKSCV1.2.6.1/buildSpacedDB.sh