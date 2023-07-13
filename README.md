## Artifact: Data, Benchmark Results, and Software of Auditory Eyesight

We organize the contents of the artifact in test cases. There are 11 folders in the repository. Each folder contains the data, benchmark results, and code. In each folder, there is a main.m file. 

After downloading the repository, the artifact can be evaluated after navigating to one of the folders and opening the main.m file in Matlab.


## Supported environments


The supported environment is Matlab (2020b or newer), which is compatible with Windows, Linux, and Mac. The system compatibility document can be found at:

https://www.mathworks.com/support/requirements/previous-releases.html

We utilized the parallel computing toolbox on Matlab to speed up the processing. We recommend using at least 32-GB RAM and 12 CPU Cores to support parallel computing. The detailed requirements of the Matlab parallel computing toolbox are available at:
https://www.mathworks.com/support/requirements/parallel-computing-toolbox.html

We used 32-GB RAM and 2x E5-2683 v3 CPUs. The system is Windows 10 Pro (version 21H2). We attached a screenshot of the system specification.
![system spec](https://github.com/auditoryeye/auditoryeye_artifact/blob/main/systemspec.PNG)

The code does not rely on GPU. 

------



## Instructions to start the parallel pool

Since our implementation utilized parallel computation, it is required to start the Matlab parallel pool to run the code. 

The first step 


### Section 4

[Data Apple](https://github.com/auditoryeye/auditoryeye_artifact/tree/main/01_proofofconcept_multiround_apple_keys/recording1_keys_interpolated)

[Ground Truth of 598 Keystrokes](https://github.com/auditoryeye/auditoryeye_artifact/blob/main/01_proofofconcept_multiround_apple_keys/recording1_keys_interpolated/keys_groundtruth.txt)

[Code](https://github.com/auditoryeye/auditoryeye_artifact/tree/main/01_proofofconcept_multiround_apple_keys)

[Localization Results of 598 Keystrokes](https://github.com/auditoryeye/auditoryeye_artifact/blob/main/01_proofofconcept_multiround_apple_keys/benchmark_results/keys_tdoa4.txt)

[Ground Truth / Recovery of 598 Keystrokes](https://github.com/auditoryeye/auditoryeye_artifact/blob/main/01_proofofconcept_multiround_apple_keys/benchmark_results/keys_tdoa4_results.txt)

------

[Data Razor](https://github.com/auditoryeye/auditoryeye_artifact/tree/main/02_proofofconcept_multiround_razor_keys/recording1_keys_interpolated)

[Ground Truth of 595 Keystrokes](https://github.com/auditoryeye/auditoryeye_artifact/blob/main/02_proofofconcept_multiround_razor_keys/recording1_keys_interpolated/keys_groundtruth.txt)

[Code](https://github.com/auditoryeye/auditoryeye_artifact/tree/main/02_proofofconcept_multiround_razor_keys)

[Localization Results of 595 Keystrokes](https://github.com/auditoryeye/auditoryeye_artifact/blob/main/02_proofofconcept_multiround_razor_keys/benchmark_results/keys_tdoa4.txt)

[Ground Truth / Recovery of 595 Keystrokes](https://github.com/auditoryeye/auditoryeye_artifact/blob/main/02_proofofconcept_multiround_razor_keys/benchmark_results/keys_tdoa4_results.txt)

------

### User Study

[Data](https://github.com/auditoryeye/auditoryeye_artifact/tree/main/03_userstudy_01/recording1_keys_interpolated)

[Ground Truth of 2909 Keystrokes](https://github.com/auditoryeye/auditoryeye_artifact/tree/main/03_userstudy_01/recording1_keys_interpolated/keys_groundtruth.txt)


[Code](https://github.com/auditoryeye/auditoryeye_artifact/tree/main/03_userstudy_01)

[Localization Results of 2909 Keystrokes](https://github.com/auditoryeye/auditoryeye_artifact/blob/main/03_userstudy_01/benchmark_results/keys_tdoa4.txt)

[Ground Truth / Recovery of 2910 Keystrokes](https://github.com/auditoryeye/auditoryeye_artifact/blob/main/03_userstudy_01/benchmark_results/keys_tdoa4_results.txt)

------

### Additional test cases

#### Angle Test Case 1


[Data](https://github.com/auditoryeye/auditoryeye_artifact/tree/main/04_additiontestcase_angle01/recording1_keys_interpolated)

[Ground Truth of 595 Keystrokes](https://github.com/auditoryeye/auditoryeye_artifact/blob/main/04_additiontestcase_angle01/recording1_keys_interpolated/keys_groundtruth.txt)

[Code](https://github.com/auditoryeye/auditoryeye_artifact/tree/main/04_additiontestcase_angle01)

[Localization Results of 595 Keystrokes](https://github.com/auditoryeye/auditoryeye_artifact/blob/main/04_additiontestcase_angle01/benchmark_results/keys_tdoa2.txt)

[Ground Truth / Recovery of 595 Keystrokes](https://github.com/auditoryeye/auditoryeye_artifact/blob/main/04_additiontestcase_angle01/benchmark_results/keys_tdoa2_results.txt)

------

#### Angle Test Case 2

[Data](https://github.com/auditoryeye/auditoryeye_artifact/tree/main/04_additiontestcase_angle02/recording1_keys_interpolated)

[Ground Truth of 594 Keystrokes](https://github.com/auditoryeye/auditoryeye_artifact/blob/main/04_additiontestcase_angle02/recording1_keys_interpolated/keys_groundtruth.txt)

[Code](https://github.com/auditoryeye/auditoryeye_artifact/tree/main/04_additiontestcase_angle02)

[Localization Results of 594 Keystrokes](https://github.com/auditoryeye/auditoryeye_artifact/blob/main/04_additiontestcase_angle02/benchmark_results/keys_tdoa2.txt)

[Ground Truth / Recovery of 594 Keystrokes](https://github.com/auditoryeye/auditoryeye_artifact/blob/main/04_additiontestcase_angle02/recording1_keys_interpolated/keys_groundtruth.txt)

------

#### Angle Test Case 3

[Data](https://github.com/auditoryeye/auditoryeye_artifact/tree/main/04_additiontestcase_angle03/recording1_keys_interpolated)

[Ground Truth of 594 Keystrokes](https://github.com/auditoryeye/auditoryeye_artifact/blob/main/04_additiontestcase_angle03/recording1_keys_interpolated/keys_groundtruth.txt)

[Code](https://github.com/auditoryeye/auditoryeye_artifact/tree/main/04_additiontestcase_angle03)

[Localization Results of 594 Keystrokes](https://github.com/auditoryeye/auditoryeye_artifact/blob/main/04_additiontestcase_angle03/benchmark_results/keys_tdoa2.txt)

[Ground Truth / Recovery of 594 Keystrokes](https://github.com/auditoryeye/auditoryeye_artifact/blob/main/04_additiontestcase_angle03/benchmark_results/keys_tdoa2_results.txt)

------

#### Angle Test Case 4

[Data](https://github.com/auditoryeye/auditoryeye_artifact/tree/main/04_additiontestcase_angle04_3mics/recording1_keys_interpolated)

[Ground Truth of 594 Keystrokes](https://github.com/auditoryeye/auditoryeye_artifact/blob/main/04_additiontestcase_angle04_3mics/recording1_keys_interpolated/keys_groundtruth.txt)

[Code](https://github.com/auditoryeye/auditoryeye_artifact/tree/main/04_additiontestcase_angle04_3mics)

[Localization Results of 594 Keystrokes](https://github.com/auditoryeye/auditoryeye_artifact/blob/main/04_additiontestcase_angle04_3mics/benchmark_results/keys_tdoa2.txt)

[Ground Truth / Recovery of 594 Keystrokes](https://github.com/auditoryeye/auditoryeye_artifact/blob/main/04_additiontestcase_angle04_3mics/benchmark_results/keys_tdoa2_results.txt)

------

#### Angle Test Case 5

[Data](https://github.com/auditoryeye/auditoryeye_artifact/tree/main/04_additiontestcase_angle05_3mics/recording1_keys_interpolated)

[Ground Truth of 594 Keystrokes](https://github.com/auditoryeye/auditoryeye_artifact/blob/main/04_additiontestcase_angle05_3mics/recording1_keys_interpolated/keys_groundtruth.txt)

[Code](https://github.com/auditoryeye/auditoryeye_artifact/tree/main/04_additiontestcase_angle05_3mics)

[Localization Results of 594 Keystrokes](https://github.com/auditoryeye/auditoryeye_artifact/blob/main/04_additiontestcase_angle05_3mics/benchmark_results/keys_tdoa2.txt)

[Ground Truth / Recovery of 594 Keystrokes](https://github.com/auditoryeye/auditoryeye_artifact/blob/main/04_additiontestcase_angle05_3mics/benchmark_results/keys_tdoa2_results.txt)

------

#### Long distance keystroke localization results


#### 1m

[Data](https://github.com/auditoryeye/auditoryeye_artifact/tree/main/04_additiontestcase_distance1m/recording1_keys_interpolated)

[Ground Truth](https://github.com/auditoryeye/auditoryeye_artifact/blob/main/04_additiontestcase_distance1m/recording1_keys_interpolated/keys_groundtruth.txt)

[Code](https://github.com/auditoryeye/auditoryeye_artifact/tree/main/04_additiontestcase_distance1m)

[Localization Results](https://github.com/auditoryeye/auditoryeye_artifact/blob/main/04_additiontestcase_distance1m/benchmark_results/keys_tdoa2.txt)


#### Results with 1m attack distance (Apple Magic keyboard)
![1m attack results](https://github.com/auditoryeye/auditoryeyesight/blob/main/longdistance_results/distance1m.PNG)
![1m attack results](https://github.com/auditoryeye/auditoryeyesight/blob/main/longdistance_results/distance1m_stats.PNG)

------

#### 2m

[Data](https://github.com/auditoryeye/auditoryeye_artifact/tree/main/04_additiontestcase_distance2m/recording1_keys_interpolated)

[Ground Truth](https://github.com/auditoryeye/auditoryeye_artifact/blob/main/04_additiontestcase_distance2m/recording1_keys_interpolated/keys_groundtruth.txt)

[Code](https://github.com/auditoryeye/auditoryeye_artifact/tree/main/04_additiontestcase_distance2m)

[Localization Results of 59x Keystrokes](https://github.com/auditoryeye/auditoryeye_artifact/blob/main/04_additiontestcase_distance2m/benchmark_results/keys_tdoa2.txt)


#### Results with 2m attack distance (Apple Magic keyboard)
![1m attack results](https://github.com/auditoryeye/auditoryeyesight/blob/main/longdistance_results/distance2m.PNG)
![1m attack results](https://github.com/auditoryeye/auditoryeyesight/blob/main/longdistance_results/distance2m_stats.PNG)


------


#### Non-line-of-sight (NLOS) laptop

[Data](https://github.com/auditoryeye/auditoryeye_artifact/tree/main/04_additiontestcase_nloslaptop/recording1_keys_interpolated)

[Ground Truth of 601 Keystrokes](https://github.com/auditoryeye/auditoryeye_artifact/blob/main/04_additiontestcase_nloslaptop/recording1_keys_interpolated/keys_groundtruth.txt)

[Code](https://github.com/auditoryeye/auditoryeye_artifact/tree/main/04_additiontestcase_nloslaptop)

[Localization Results of 601 Keystrokes](https://github.com/auditoryeye/auditoryeye_artifact/blob/main/04_additiontestcase_nloslaptop/benchmark_results/keys_tdoa4.txt)

[Ground Truth / Recovery of 601 Keystrokes](https://github.com/auditoryeye/auditoryeye_artifact/blob/main/04_additiontestcase_nloslaptop/benchmark_results/keys_tdoa4_results.txt)

