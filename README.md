## Artifact: Data, Benchmark Results, and Software of Auditory Eyesight

Overview:

We organize the contents of the artifact in test cases. There are 11 folders in the repository. Each folder contains the data, benchmark results, and code. In each folder, there is a main.m file. 

After downloading the repository, the artifact can be evaluated after navigating to one of the folders and opening the main.m file in Matlab.

### Table of Contents
**[Supported Environments](https://github.com/auditoryeye/auditoryeye_artifact/blob/main/README.md#supported-environments)**<br>
**[Instructions to Start the Parallel Pool](https://github.com/auditoryeye/auditoryeye_artifact/blob/main/README.md#instructions-to-start-the-parallel-pool)**<br>
**[Step-by-Step Instructions to Use the Code in the First Test](https://github.com/auditoryeye/auditoryeye_artifact/blob/main/README.md#step-by-step-instructions-to-run-the-first-test)**<br>
**[Experiment Section 4](https://github.com/auditoryeye/auditoryeye_artifact/blob/main/README.md#section-4)**<br>
**[Experiment User Study](https://github.com/auditoryeye/auditoryeye_artifact/blob/main/README.md#user-study)**<br>
**[Experiment Additional Test Case](https://github.com/auditoryeye/auditoryeye_artifact/blob/main/README.md#additional-test-cases)**<br>


### Dataset:

**[Data Apple](https://github.com/auditoryeye/auditoryeye_artifact/tree/main/01_proofofconcept_multiround_apple_keys/recording1_keys_interpolated)**<br>
**[Data Razor](https://github.com/auditoryeye/auditoryeye_artifact/tree/main/02_proofofconcept_multiround_razor_keys/recording1_keys_interpolated)**<br>
**[Data User](https://github.com/auditoryeye/auditoryeye_artifact/tree/main/03_userstudy_01/recording1_keys_interpolated)**<br>
**[Data A01](https://github.com/auditoryeye/auditoryeye_artifact/tree/main/04_additiontestcase_angle01/recording1_keys_interpolated)**<br>
**[Data A02](https://github.com/auditoryeye/auditoryeye_artifact/tree/main/04_additiontestcase_angle02/recording1_keys_interpolated)**<br>
**[Data A03](https://github.com/auditoryeye/auditoryeye_artifact/tree/main/04_additiontestcase_angle03/recording1_keys_interpolated)**<br>
**[Data A04](https://github.com/auditoryeye/auditoryeye_artifact/tree/main/04_additiontestcase_angle04_3mics/recording1_keys_interpolated)**<br>
**[Data A05](https://github.com/auditoryeye/auditoryeye_artifact/tree/main/04_additiontestcase_angle05_3mics/recording1_keys_interpolated)**<br>
**[Data D01](https://github.com/auditoryeye/auditoryeye_artifact/tree/main/04_additiontestcase_distance1m/recording1_keys_interpolated)**<br>
**[Data D02](https://github.com/auditoryeye/auditoryeye_artifact/tree/main/04_additiontestcase_distance2m/recording1_keys_interpolated)**<br>
**[NLOS laptop](https://github.com/auditoryeye/auditoryeye_artifact/tree/main/04_additiontestcase_nloslaptop/recording1_keys_interpolated)**<br>

## Supported Environments


1. The supported environment is Matlab (2020b or newer), which is compatible with Windows, Linux, and Mac. The system compatibility document can be found at:

https://www.mathworks.com/support/requirements/previous-releases.html

2. We utilized the parallel computing toolbox on Matlab to speed up the processing. We recommend using at least 32-GB RAM and 12 CPU Cores to support parallel computing. The detailed requirements of the Matlab parallel computing toolbox are available at:
https://www.mathworks.com/support/requirements/parallel-computing-toolbox.html

3. We used 32-GB RAM and 2x E5-2683 v3 CPUs. The system is Windows 10 Pro (version 21H2). We attached a screenshot of the system specification.
![system spec](https://github.com/auditoryeye/auditoryeye_artifact/blob/main/systemspec.PNG)

4. The code does not rely on GPU. 

------



## Instructions to Start the Parallel Pool

Since our implementation utilized parallel computation, it is required to start the Matlab parallel pool to run the code. 

1. The first step is to click the icon in the bottom-left corner:

![system spec](https://github.com/auditoryeye/auditoryeye_artifact/blob/main/parallelpool/parallelpool01.PNG)

2. The second step is to click Start Parallel Pool:

![system spec](https://github.com/auditoryeye/auditoryeye_artifact/blob/main/parallelpool/parallelpool02.PNG)

3. Alternatively, the Parallel Pool can be directly started by the command ```parpool```:

![system spec](https://github.com/auditoryeye/auditoryeye_artifact/blob/main/parallelpool/parallelpool03notation.PNG)


There is a default parallel pool called ```local```. It usually works without further configuration. If necessary, users may select pool size and cluster following this documentation:

https://www.mathworks.com/help/parallel-computing/run-code-on-parallel-pools.html

------

## Step-by-Step Instructions to Use the Code in the First Test


#### 1. Navigate to the ```01_proofofconcept_multiround_apple_keys``` folder:
![01step01](https://github.com/auditoryeye/auditoryeye_artifact/blob/main/1sttestinstruction/1stinstruction01.PNG)

We can see that ```recording1_keys_interpolated``` folder does not contain computation results before running the code.

#### 2. Evaluate the command ```run('YZProcessing04_tdoa.m');```:
![01step02](https://github.com/auditoryeye/auditoryeye_artifact/blob/main/1sttestinstruction/1stinstruction02.PNG)



#### 3. We can see that the results are written to the txt files in ```recording1_keys_interpolated``` folder:
![01step03](https://github.com/auditoryeye/auditoryeye_artifact/blob/main/1sttestinstruction/1stinstruction03.PNG)


#### 4. Evaluate the command ```run('YZProcessing05_statistics_remoutlier.m');```:
![01step04](https://github.com/auditoryeye/auditoryeye_artifact/blob/main/1sttestinstruction/1stinstruction04a.PNG)

#### 5. We can see the illustrated I-Round keystroke localization results:
![01step05](https://github.com/auditoryeye/auditoryeye_artifact/blob/main/1sttestinstruction/1stinstruction04.PNG)


#### 6. Evaluate the command ```run('YZProcessing05_statistics_remoutlier.m');```:
![01step06](https://github.com/auditoryeye/auditoryeye_artifact/blob/main/1sttestinstruction/1stinstruction05.PNG)

We can see the illustrated mean and standard deviation statistics of I-Round results:
![01step07](https://github.com/auditoryeye/auditoryeye_artifact/blob/main/1sttestinstruction/1stinstruction06.PNG)

#### 7. Evaluate the command ```run('Statistics201_figure_2d_1round.m');```:
![01step08](https://github.com/auditoryeye/auditoryeye_artifact/blob/main/1sttestinstruction/1stinstruction07.PNG)

We can see the 2D illustration of I-Round localization results:
![01step09](https://github.com/auditoryeye/auditoryeye_artifact/blob/main/1sttestinstruction/1stinstruction08.PNG)


#### 8. Evaluate the command ```run('YZProcessing06_2ndround.m');```:
![01step10](https://github.com/auditoryeye/auditoryeye_artifact/blob/main/1sttestinstruction/1stinstruction09.PNG)

We can see that the results are written to the txt files in ```recording1_keys_interpolated``` folder:

![01step11](https://github.com/auditoryeye/auditoryeye_artifact/blob/main/1sttestinstruction/1stinstruction10.PNG)


#### 9. Evaluate the command ```run('YZProcessing07_2ndroundstatistics.m');```:
![01step12](https://github.com/auditoryeye/auditoryeye_artifact/blob/main/1sttestinstruction/1stinstruction11.PNG)

We can see the illustrated B-Round keystroke localization results:
![01step13](https://github.com/auditoryeye/auditoryeye_artifact/blob/main/1sttestinstruction/1stinstruction12.PNG)

#### 10. Evaluate the command ```run('Statistics101_round2.m');```:
![01step14](https://github.com/auditoryeye/auditoryeye_artifact/blob/main/1sttestinstruction/1stinstruction13.PNG)

We can see the illustrated mean and standard deviation statistics of B-Round results:
![01step05](https://github.com/auditoryeye/auditoryeye_artifact/blob/main/1sttestinstruction/1stinstruction14.PNG)


#### 11. Evaluate the command ```run('Statistics201_figure_2d_2round.m');```:
![01step16](https://github.com/auditoryeye/auditoryeye_artifact/blob/main/1sttestinstruction/1stinstruction15.PNG)

We can see the 2D illustration of B-Round localization results:
![01step17](https://github.com/auditoryeye/auditoryeye_artifact/blob/main/1sttestinstruction/1stinstruction16.PNG)



#### 8. Evaluate the command ```run('YZProcessing08_3rdround.m');```:
![01step10](https://github.com/auditoryeye/auditoryeye_artifact/blob/main/1sttestinstruction/1stinstruction17.PNG)

We can see that the results are written to the txt files in ```recording1_keys_interpolated``` folder:

![01step11](https://github.com/auditoryeye/auditoryeye_artifact/blob/main/1sttestinstruction/1stinstruction18.PNG)

------



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

[Ground Truth / Recovery of 2909 Keystrokes](https://github.com/auditoryeye/auditoryeye_artifact/blob/main/03_userstudy_01/benchmark_results/keys_tdoa4_results.txt)

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

[Localization Results of 625 Keystrokes](https://github.com/auditoryeye/auditoryeye_artifact/blob/main/04_additiontestcase_distance2m/benchmark_results/keys_tdoa2.txt)


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

