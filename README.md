---
author:
- Francesco Refolli
bibliography:
- quotes.bib
nocite: "[@*]"
subtitle: "*Machine Learning Paradigms* Exam"
title: Transfer Learning through Federated Reinforcement Learning
---

::: frame
### The Multi-Agent Simulation Setting

::: columns
::: column
0.5

![Ring-Road of a Metropolitan City
[@CorSera1973]](figures/Milano-Circonvalla.png){width="100%"}
:::

::: column
0.5

![4-Way Double-Lane Traffic Light Regulated Intersection
[@TuttoCitta2026]](figures/Milano-Intersezione.png){width="100%"}
:::
:::
:::

::: frame
### The Multi-Agent Reinforcement Learning Story So Far

![Comparison of Approaches for Rearching Demand
Coverage[@Refolli2025]](figures/curriculum-vs-monolithic.png){width="65%"}
:::

::: frame
### The Multi-Agent Reinforcement Learning Story So Far

![Agents sharing Observation
[@Refolli2025]](figures/shared-observation-learning.png){width="75%"}

![Agents sharing Rewards
[@Refolli2025]](figures/shared-reward-learning.png){width="75%"}
:::

::: frame
### Centralized Reinforcement Learning

![image](figures/centralized-learning.png){width="75%"}
:::

::: frame
### Federated Reinforcement Learning

![image](figures/federated-learning.png){width="75%"}
:::

::: frame
### The Simulator: UXsim

UXSim [@seo2025joss] is a Free and Open-Source *macroscopic* and
*mesoscopic* network traffic flow simulator. It's tailored to simulate
private-mobility simulations. It's a **\"Lightweight\"**,
**Library-Based** and **Written in Python**.

::: columns
::: column
0.5

![image](figures/uxsim-example.png){width="80%"}
:::

::: column
0.5

![image](figures/uxsim-example-2.png){width="80%"}
:::
:::
:::

::: frame
### The Agent Model

::: columns
::: column
0.5

-   The Agent can change Traffic Light Phase every 10 seconds

-   Each one of the two *phases* gives *right of way* to one of the two
    flows

-   The Agent can see the density of vehicles in each one of the roads
    (input/output)

-   The Agent is rewarded based on vehicle queues' length, specifically
    on the amount vehicles en/dequeuing
:::

::: column
0.5

![4-Way Double-Lane Traffic Light Regulated
Intersection](figures/Milano-Agente.png){width="100%"}
:::
:::
:::

::: frame
### The Traffic Model

::: columns
::: column
0.5

![Ring-Road of a Metropolitan City
[@CorSera1973]](figures/Milano-Circonvalla.png){width="100%"}
:::

::: column
0.5

-   Two-Lanes per Road Link

-   Road Length is $1000$ m $=$ $1$ km

-   Free Flow Speed is $20$ m/s $\approx$ $72$ km/h
    [@nagatani2002physics]

-   Traffic Jam Density is set to $\rho = 0.2$ $approx$ $40$
    veh/2lanes/1km [@nagatani2002physics]

-   No Platoons allowed, as in the Real-World (at least for now \...)

-   No simulated Pedestrian Crossing, nor Public Transit (of any kind)
:::
:::
:::

::: frame
### The Demand Model / Training Scenarios

::: columns
::: column
0.5

![Ring-Road of a Metropolitan City
[@CorSera1973]](figures/Milano-Circonvalla.png){width="100%"}
:::

::: column
0.5

-   All Mid\
    (**Piazzale Fratelli Zavattari**)

-   Peak East to West\
    (**Piazzale Loreto**)

-   Peak West to East\
    (**Piazza Simone Bolivar**)

-   Peak North to South\
    (**Piazza Firenze**)

-   Peak South to North\
    (**Piazzale Lodi**)
:::
:::
:::

::: frame
### The Demand Model / Evaluation Scenarios

::: columns
::: column
0.5

![Ring-Road of a Metropolitan City
[@CorSera1973]](figures/Milano-Circonvalla.png){width="100%"}
:::

::: column
0.5

-   Training Scenarios

-   $+ \; 5 \; \times \;$ Random Demand

-   Each entry of the four (EW, WE, NS, SN) is random

-   Demand is in range $[0.3, 0.8]$

-   The demand's percentage describes the amount of vehicles per unit of
    capacity
:::
:::
:::

::: frame
### The FedAvg Algorithm

::: columns
::: column
0.5

``` {style="pythonstyle" caption="FedAvg Algorithm" mathescape=""}
def Coordinator():
  $\theta$ = Policy.New()
  $\forall c \in C \; | \; SendToClient(c, \theta)$
  for $e \in \{1,..,E\}$:
    $\{(\theta_1, w_1) ...\} = \{ GetFromClient(c) \; | \; \forall c \in C\}$
    $\{\alpha_1 ...\} = \{\frac {w_1} {\Sigma w_i} ...\}$
    $\theta = \Sigma \alpha_i \theta_i$
    $\forall c \in C \; | \; SendToClient(c, \theta)$
  return $\theta$

def Client(scenario):
  for $e \in \{1,..,E\}$:
    $\theta = GetFromCoordinator()$
    $\theta', w$ = Simulation($\theta$, scenario)
    $SendToCoordinator(\theta')$
```
:::

::: column
0.5

-   Knowledge is weighted on the complexity of the scenario of a client

-   \... which is equal to the demand that the client has to deal with

-   Due to resource constrains, only 5 Peers were used, with no client
    sampling

-   The duration of a simulation is $3600s \; = \; 1hr \; = \; 360$
    steps.
:::
:::
:::

::: frame
### Results / Training

![Total Reward during Training over Time
(Episodes)](figures/models-training-stats.png){width="\\textwidth"}
:::

::: frame
### Results / Evaluation

![Average Total Reward during Evaluation over Time (Initial +
Episodes)](figures/models-evaluation-stats.png){width="\\textwidth"}
:::

::: frame
### Results / The Federated Coordinator is Catching Up!

![Average Total Reward during Evaluation over Time (Initial +
Episodes)](figures/federated-coordinator-catching-up.png){width="\\textwidth"}
:::

::: frame
### Comparisons / Fixed-Cycle Agents

![Average Total Reward during Evaluation of Fixed-Cycle Agents
(*CTLA_Ts* means $T$ seconds per
phase)](figures/CTLA-10-is-best-60-is-worst.png){width="\\textwidth"}
:::

::: frame
### Comparisons / Is Deep Q-Learning Worth the Effort?

![Comparison of Average Total Reward obtained by Deep Q-Learning Models
and Fixed-Cycle Agents during
Evaluation](figures/FedRL-and-CRL-Learned-a-Better-Policy-then-CTLA.png){width="\\textwidth"}
:::

::: frame
### Comparisons / Is Deep Q-Learning Worth the Effort?

![Comparison of Average Total Reward obtained by Deep Q-Learning Models
and Fixed-Cycle Agents during
Evaluation](figures/FedRL-and-CRL-Learned-a-Better-Policy-then-B_W_CTLA.png){width="\\textwidth"}
:::

::: frame
### Visualizing that Reward Difference

::: columns
::: column
0.5

![Microscopic visualization of Fixed-Agent (10s per
phase)](figures/gif-CTLA-10s.png){width="100%"}
:::

::: column
0.5

![Microscopic visualization of Fixed-Agent (60s per
phase)](figures/gif-CTLA-60s.png){width="100%"}
:::
:::
:::

::: frame
### Visualizing that Reward Difference

::: columns
::: column
0.5

![Microscopic visualization of Centralized Learning
Agent](figures/gif-CLR.png){width="100%"}
:::

::: column
0.5

![Microscopic visualization of Federated Learning
Agent](figures/gif-FedLR.png){width="100%"}
:::
:::
:::

::: frame
Thank You

![image](figures/github-repo.png){width="90%"}
:::

::: frame
### Bibliography
:::
