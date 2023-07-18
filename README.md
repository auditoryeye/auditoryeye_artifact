## Artifact: Data, Benchmark Results, and Software of Auditory Eyesight

Overview:

We organize the contents of the artifact in test cases. There are 11 folders in the repository. Each folder contains the data, benchmark results, and code. In each folder, there is a main.m file. 

After downloading the repository, the artifact can be evaluated after navigating to one of the folders and opening the main.m file in Matlab. Users can follow the Step-by-Step Instructions to start the [Parallel Pool](https://github.com/auditoryeye/auditoryeye_artifact/tree/main#instructions-to-start-the-parallel-pool) and to [use the code](https://github.com/auditoryeye/auditoryeye_artifact/tree/main#step-by-step-instructions-to-use-the-code-in-the-first-test).

### Table of Contents
**[Supported Environments](https://github.com/auditoryeye/auditoryeye_artifact/tree/main#supported-environments)**<br>
**[Instructions to Start the Parallel Pool](https://github.com/auditoryeye/auditoryeye_artifact/tree/main#instructions-to-start-the-parallel-pool)**<br>
**[Step-by-Step Instructions to Use the Code in the First Test](https://github.com/auditoryeye/auditoryeye_artifact/tree/main#step-by-step-instructions-to-use-the-code-in-the-first-test)**<br>
**[Experiment Section 4](https://github.com/auditoryeye/auditoryeye_artifact/tree/main#section-4)**<br>
**[Experiment User Study](https://github.com/auditoryeye/auditoryeye_artifact/tree/main#user-study)**<br>
**[Experiment Additional Test Case](https://github.com/auditoryeye/auditoryeye_artifact/tree/main#additional-test-cases)**<br>


The results of each of the steps are illustrated. Users can try to introduce additional signal processing and feature extraction (such as FFT, MFCC) in the future to improve the results. The data can be accessed from the following links:
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


### Required minimum disk size and Matlab computation time report (with dual E5-2683 V3 CPUs and 32-GB RAM):

| Experiment | Disk Size | Computation time |
| :---         |     :---:      |          ---: |
| [E1Apple](https://github.com/auditoryeye/auditoryeye_artifact/tree/main/01_proofofconcept_multiround_apple_keys)   | [1.77 GB](https://github.com/auditoryeye/auditoryeye_artifact/blob/main/time_and_space/E1_apple_space.PNG)    |  [255.688 s](https://github.com/auditoryeye/auditoryeye_artifact/blob/main/time_and_space/E1_apple_compute_time.pdf)   |
| [E2Razor](https://github.com/auditoryeye/auditoryeye_artifact/tree/main/02_proofofconcept_multiround_razor_keys)   | [1.76 GB](https://github.com/auditoryeye/auditoryeye_artifact/blob/main/time_and_space/E2_razor_space.PNG)    |  [260.267 s](https://github.com/auditoryeye/auditoryeye_artifact/blob/main/time_and_space/E2_razor_compute_time.pdf)   |
| [E3User01](https://github.com/auditoryeye/auditoryeye_artifact/tree/main/03_userstudy_01)   | [8.61 GB](https://github.com/auditoryeye/auditoryeye_artifact/blob/main/time_and_space/E3_space.PNG)    |  [1190.288 s](https://github.com/auditoryeye/auditoryeye_artifact/blob/main/time_and_space/E3_compute_time.PNG)   |
| [E4Angle01](https://github.com/auditoryeye/auditoryeye_artifact/tree/main/04_additiontestcase_angle01)   | [1.76 GB](https://github.com/auditoryeye/auditoryeye_artifact/blob/main/time_and_space/E4_space.PNG)    |  [103.066 s](https://github.com/auditoryeye/auditoryeye_artifact/blob/main/time_and_space/E4_compute_time.PNG)   |
| [E5Angle02](https://github.com/auditoryeye/auditoryeye_artifact/tree/main/04_additiontestcase_angle02)   | [1.75 GB](https://github.com/auditoryeye/auditoryeye_artifact/blob/main/time_and_space/E5_space.PNG)    |  [116.119 s](https://github.com/auditoryeye/auditoryeye_artifact/blob/main/time_and_space/E5_compute_time.PNG)   |
| [E6Angle03](https://github.com/auditoryeye/auditoryeye_artifact/tree/main/04_additiontestcase_angle03)   | [1.75 GB](https://github.com/auditoryeye/auditoryeye_artifact/blob/main/time_and_space/E6_space.PNG)    |  [188.849 s](https://github.com/auditoryeye/auditoryeye_artifact/blob/main/time_and_space/E6_compute_time.PNG)   |
| [E7Angle04](https://github.com/auditoryeye/auditoryeye_artifact/tree/main/04_additiontestcase_angle04_3mics)   | [. GB]()    |  [. s]()   |
| [E8Angle05](https://github.com/auditoryeye/auditoryeye_artifact/tree/main/04_additiontestcase_angle05_3mics)   | [. GB]()    |  [. s]()   |
| [E9Distance1m](https://github.com/auditoryeye/auditoryeye_artifact/tree/main/04_additiontestcase_distance1m)   | [. GB]()    |  [. s]()   |
| [E10Distance2m](https://github.com/auditoryeye/auditoryeye_artifact/tree/main/04_additiontestcase_distance2m)   | [. GB]()    |  [. s]()   |
| [E11NLOSLaptop](https://github.com/auditoryeye/auditoryeye_artifact/tree/main/04_additiontestcase_nloslaptop)   | [. GB]()    |  [. s]()   |

[Screenshots and Matlab Performance Reports](https://github.com/auditoryeye/auditoryeye_artifact/tree/main/time_and_space)


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



#### 12. Evaluate the command ```run('YZProcessing08_3rdround.m');```:
![01step10](https://github.com/auditoryeye/auditoryeye_artifact/blob/main/1sttestinstruction/1stinstruction17.PNG)

We can see that the results are written to the txt files in ```recording1_keys_interpolated``` folder:

![01step11](https://github.com/auditoryeye/auditoryeye_artifact/blob/main/1sttestinstruction/1stinstruction18.PNG)


#### 13. Evaluate the command ```run('YZProcessing09_3rdroundstatistics.m');```:
![01step12](https://github.com/auditoryeye/auditoryeye_artifact/blob/main/1sttestinstruction/1stinstruction19.PNG)

We can see the illustrated T-Round keystroke localization results:
![01step13](https://github.com/auditoryeye/auditoryeye_artifact/blob/main/1sttestinstruction/1stinstruction20.PNG)


#### 14. Evaluate the command ```run('Statistics101_round3.m');```:
![01step14](https://github.com/auditoryeye/auditoryeye_artifact/blob/main/1sttestinstruction/1stinstruction21.PNG)

We can see the illustrated mean and standard deviation statistics of T-Round results:
![01step05](https://github.com/auditoryeye/auditoryeye_artifact/blob/main/1sttestinstruction/1stinstruction22.PNG)


#### 15. Evaluate the command ```run('YZProcessing10_4thround.m');```:
![01step10](https://github.com/auditoryeye/auditoryeye_artifact/blob/main/1sttestinstruction/1stinstruction23.PNG)

We can see that the results are written to the txt files in ```recording1_keys_interpolated``` folder:

![01step11](https://github.com/auditoryeye/auditoryeye_artifact/blob/main/1sttestinstruction/1stinstruction24.PNG)


#### 16. Evaluate the command ```run('YZProcessing11_4throundstatistics.m');```:
![01step12](https://github.com/auditoryeye/auditoryeye_artifact/blob/main/1sttestinstruction/1stinstruction25.PNG)

We can see the illustrated C-Round keystroke localization results:
![01step13](https://github.com/auditoryeye/auditoryeye_artifact/blob/main/1sttestinstruction/1stinstruction26.PNG)

#### 17. Similaryly, evaluate the commands ```run('YZProcessing12_5thround.m');``` and ```run('YZProcessing13_5throundstatistics.m');```








#### 18. Evaluate the command ```run('Statistics101_round5.m');```:
![01step14](https://github.com/auditoryeye/auditoryeye_artifact/blob/main/1sttestinstruction/1stinstruction31.PNG)

We can see the illustrated mean and standard deviation statistics of Final-Round results:
![01step05](https://github.com/auditoryeye/auditoryeye_artifact/blob/main/1sttestinstruction/1stinstruction32.PNG)


#### 19. Evaluate the command ```run('Statistics201_figure_2d_5round.m');```:
![01step16](https://github.com/auditoryeye/auditoryeye_artifact/blob/main/1sttestinstruction/1stinstruction33.PNG)

We can see the 2D illustration of Final-Round localization results:
![01step17](https://github.com/auditoryeye/auditoryeye_artifact/blob/main/1sttestinstruction/1stinstruction34.PNG)



#### 20. Evaluate the command ```run('Statistics_accuracy_calculation.m');```:
![01step16](https://github.com/auditoryeye/auditoryeye_artifact/blob/main/1sttestinstruction/1stinstruction35.PNG)

We can observe accuracies:
![01step17](https://github.com/auditoryeye/auditoryeye_artifact/blob/main/1sttestinstruction/1stinstruction36.PNG)

The detailed results are written into the ```keys_tdoa4_results.txt``` and ```keys_tdoa4_results_accuracy.txt``` files. 

















------



### Section 4

Required minimum disk space: [1.77 GB](https://github.com/auditoryeye/auditoryeye_artifact/blob/main/time_and_space/E1_apple_space.PNG). Reference computation time with dual E5-2683 V3 CPUs and 32-GB RAM): [255.688 s](https://github.com/auditoryeye/auditoryeye_artifact/blob/main/time_and_space/E1_apple_compute_time.pdf)

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

