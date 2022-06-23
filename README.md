# CIproject (to be aborted soon to be integrated elsewhere)

This repository contains an early attempt to construct a CI workflow, within the GitHub Actions functionalities, for the DMFT solver package of the QcmProject. The workflow will test the correct building in two different OS as provided by GitHub, that is ubuntu-20.04 and macos-11

### Contents
* The repository contains some bash script inst_scifor.sh, inst_DMFTtools.sh, inst_LIBDMFT_ED.sh, inst_Slave_Spins.sh that take care of installing the respective libraries.
* The folder unittest contains some tests for SciFortran functions.
* The script RunTests.sh takes care of running the tests.



### Workflow status:

Weekly test: ![example workflow](https://github.com/SamueleGiuli/CIproject_QcmP/actions/workflows/Scheduled.yml/badge.svg)

Manual test: ![example workflow](https://github.com/SamueleGiuli/CIproject_QcmP/actions/workflows/ManualWorkflow.yml/badge.svg)

### To be done

Driver installation and check results at convergence. Separate workflows for single repos. Create a setup action for generic QcmP workflows.
