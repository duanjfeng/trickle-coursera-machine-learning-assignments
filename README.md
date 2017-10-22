# trickle-coursera-machine-learning-assignments

Completed assignments using Octave for Coursera Machine Learning by Andrew Ng, Stanford.<br/>

## 概述
8月21日注册，9月14日完成，这门课程的确通俗易懂，适合入门学习。视频和小测验主要是在上下班的地铁上完成的，编程作业则是晚上或者周末抽空完成的。<br/><br/>
由于每次作业的主要框架代码都已经提供，只要认真学习了视频、讲义、作业指南，再辅以作业资源、作业论坛，完成算法代码片段其实比较容易。<br/><br/>
为了方便以后查看，将所有代码都提交到github上。自己编写的部分以%%---begin开始，以%%---end结束，并添加了注释。<br/><br/>

## 关于编程语言
由于Matlab太大，需要付费，Octave又没有用过，一开始就在纠结是不是直接用Python实现（当然Python都忘记了，也需要再学一遍）。<br/><br/>
但是课程推荐用Octave，于是下载安装了4.0.3（http://wiki.octave.org/Octave_for_macOS），自始至终也没有出过问题，所以Mac用户请放心使用。<br/><br/>

## 关于作业
通常作业指南会让你完成一个任务提交一次，但是也可以集中一次提交，我是选的后一种方式。<br/><br/>
通常作业指南会给出每一个任务的期望结果，如果你的程序运行结果与期望结果不一致，那么几乎可以肯定是代码写错了。<br/><br/>
尽可能使用矩阵运算实现，而不是for循环，前者更为简洁，运算效率更高。<br/><br/>
矩阵运算最常见的错误是维度不符合运算规则，所以使用矩阵运算前先分析矩阵的维度。<br/><br/>
注意区分矩阵、向量和数，例如cost是数，而gradient是矩阵；区分矩阵运算和矩阵中每个元素的运算（即所谓element-wise运算）。<br/><br/>
数据集的规模m、特征的数量n等变量最好参数化，或者从参数中获取（例如使用size方法），从而使得程序更具有普适性。<br/><br/>
如果一次计算比较复杂，可以考虑分成几个部分来写然后求和，例如正则化的cost函数。<br/><br/>

## 目录
*   ex1：Linear Regression（线性回归）
*   ex2：Logistic Regression（逻辑回归）
*   ex3：Multi-class Classification and Neural Network（多类分类，神经网络）
*   ex4：Neural Network Learning（神经网络学习）
*   ex5：Regularized Linear Regression and Bias v.s. Variance（正则化线性回归，偏差和方差）
*   ex6：Support Vector Machines（支持向量机）
*   ex7：K-means Clustering and Principal Component Analysis（K近邻聚类，主成分分析）
*   ex8：Anomaly Detection and Recommender Systems（异常检测，推荐系统）
