<style>
div.columns {
  display: grid;
  grid-template-columns: 50% 50%;
}

div.colum {
  display: flex;
  align-items: center;
}
</style>

### Transfer Learning through Federated Learing

<figure>
<img src="figures/github-repo.png" style="width:90.0%" />
</figure>

### The Multi-Agent Simulation Setting

<div class="columns"><div class="column">
  <figure>
  <img src="figures/Milano-Circonvalla.png" style="width:100.0%" />
  <figcaption>Ring-Road of a Metropolitan City <span class="citation"
  data-cites="CorSera1973"></span></figcaption>
  </figure>
</div><div class="column">
  <figure>
  <img src="figures/Milano-Intersezione.png" style="width:100.0%" />
  <figcaption>4-Way Double-Lane Traffic Light Regulated Intersection <span
  class="citation" data-cites="TuttoCitta2026"></span></figcaption>
  </figure>
</div></div>

### The Multi-Agent Reinforcement Learning Story So Far

<figure>
<img src="figures/curriculum-vs-monolithic.png" style="width:65.0%" />
<figcaption>Comparison of Approaches for Rearching Demand Coverage<span
class="citation" data-cites="Refolli2025"></span></figcaption>
</figure>

<figure>
<img src="figures/shared-observation-learning.png"
style="width:75.0%" />
<figcaption>Agents sharing Observation <span class="citation"
data-cites="Refolli2025"></span></figcaption>
</figure>

<figure>
<img src="figures/shared-reward-learning.png" style="width:75.0%" />
<figcaption>Agents sharing Rewards <span class="citation"
data-cites="Refolli2025"></span></figcaption>
</figure>

### Centralized Reinforcement Learning

<figure>
<img src="figures/centralized-learning.png" style="width:75.0%" />
</figure>

### Federated Reinforcement Learning

<figure>
<img src="figures/federated-learning.png" style="width:75.0%" />
</figure>

### The Simulator: UXsim

UXSim is a Free and Open-Source *macroscopic* and *mesoscopic* network
traffic flow simulator. It’s tailored to simulate private-mobility
simulations. It’s **"Lightweight"**, **Library-Based** and **Written
in Python**.

<div class="columns"><div class="column">
  <figure>
  <img src="figures/uxsim-example.png" style="width:100.0%" />
  </figure>
</div><div class="column">
  <figure>
  <img src="figures/uxsim-example-2.png" style="width:100.0%" />
  </figure>
</div></div>

### The Agent Model

<div class="columns"><div class="column">
  <ul>
    <li>The Agent can change Traffic Light Phase every 10 seconds</li>
    <li>Each one of the two *phases* gives *right of way* to one of the two flows</li>
    <li>The Agent can see the density of vehicles in each one of the roads (input/output)</li>
    <li>The Agent is rewarded based on vehicle queues’ length, specifically on the amount vehicles en/dequeuing</li>
  </ul>
</div><div class="column">
  <figure>
  <img src="figures/Milano-Agente.png" style="width:100.0%" />
  <figcaption>4-Way Double-Lane Traffic Light Regulated
  Intersection</figcaption>
  </figure>
</div></div>

### The Traffic Model

<div class="columns"><div class="column">
  <figure>
  <img src="figures/Milano-Circonvalla.png" style="width:100.0%" />
  <figcaption>Ring-Road of a Metropolitan City <span class="citation"
  data-cites="CorSera1973"></span></figcaption>
  </figure>
</div><div class="column">
  <ul>
    <li>Two-Lanes per Road Link</li>
    <li>Road Length is 1000 m = 1 km</li>
    <li>Free Flow Speed is 20 m/s ≈ 72 km/h</li>
    <li>Traffic Jam Density is set to $ρ = 0.2 \approx 40$ veh/lane/1km</li>
    <li>No Platoons allowed, as in the Real-World (at least for now ...)</li>
    <li>No simulated Pedestrian Crossing, nor Public Transit (of any kind)</li>
  </ul>
</div></div>

### The Demand Model / Training Scenarios

<div class="columns"><div class="column">
  <figure>
  <img src="figures/Milano-Circonvalla.png" style="width:100.0%" />
  <figcaption>Ring-Road of a Metropolitan City <span class="citation"
  data-cites="CorSera1973"></span></figcaption>
  </figure>
</div><div class="column">
  <ul>
    <li>All Mid <span style="font-weight: bold">Piazzale Fratelli Zavattari</span></li>
    <li>Peak East to West <span style="font-weight: bold">Piazzale Loreto</span></li>
    <li>Peak West to East <span style="font-weight: bold">Piazza Simone Bolivar</span></li>
    <li>Peak North to South <span style="font-weight: bold">Piazza Firenze</span></li>
    <li>Peak South to North <span style="font-weight: bold">Piazzale Lodi</span></li>
  </ul>
</div></div>

### The Demand Model / Evaluation Scenarios

<div class="columns"><div class="column">
  <figure>
  <img src="figures/Milano-Circonvalla.png" style="width:100.0%" />
  <figcaption>Ring-Road of a Metropolitan City <span class="citation"
  data-cites="CorSera1973"></span></figcaption>
  </figure>
</div><div class="column">
  <ul>
    <li>Training Scenarios</li>
    <li>+ 5 ×  Random Demand</li>
    <li>Each entry of the four (EW, WE, NS, SN) is random</li>
    <li>Demand is in range $[0.3, 0.8]$</li>
    <li>The demand’s percentage describes the amount of vehicles per unit of capacity</li>
  </ul>
</div></div>

### The FedAvg Algorithm

<div class="columns"><div class="column">
  <figure>
  <img src="figures/FedAvg.png" style="width:100.0%" />
  <figcaption>Variant of FedAvg used<span class="citation"
  data-cites="CorSera1973"></span></figcaption>
  </figure>
</div><div class="column">
  <ul>
    <li>Knowledge is weighted on the complexity of the scenario of a client</li>
    <li>... which is equal to the demand that the client has to deal with</li>
    <li>Due to resource constrains, only 5 Peers were used, with no client sampling</li>
    <li>The duration of a simulation is 3600*s* = 1*h**r* = 360 steps.</li>
  </ul>
</div></div>

### Results / Training

<figure>
<img src="figures/models-training-stats.png" />
<figcaption>Total Reward during Training over Time
(Episodes)</figcaption>
</figure>

### Results / Evaluation

<figure>
<img src="figures/models-evaluation-stats.png" />
<figcaption>Average Total Reward during Evaluation over Time (Initial +
Episodes)</figcaption>
</figure>

### Results / The Federated Coordinator is Catching Up!

<figure>
<img src="figures/federated-coordinator-catching-up.png" />
<figcaption>Average Total Reward during Evaluation over Time (Initial +
Episodes)</figcaption>
</figure>

### Comparisons / Fixed-Cycle Agents

<figure>
<img src="figures/CTLA-10-is-best-60-is-worst.png" />
<figcaption>Average Total Reward during Evaluation of Fixed-Cycle Agents
(<em>CTLA_Ts</em> means <span class="math inline"><em>T</em></span>
seconds per phase)</figcaption>
</figure>

### Comparisons / Is Deep Q-Learning Worth the Effort?

<figure>
<img
src="figures/FedRL-and-CRL-Learned-a-Better-Policy-then-CTLA.png" />
<figcaption>Comparison of Average Total Reward obtained by Deep
Q-Learning Models and Fixed-Cycle Agents during Evaluation</figcaption>
</figure>

### Comparisons / Is Deep Q-Learning Worth the Effort?

<figure>
<img
src="figures/FedRL-and-CRL-Learned-a-Better-Policy-then-B_W_CTLA.png" />
<figcaption>Comparison of Average Total Reward obtained by Deep
Q-Learning Models and Fixed-Cycle Agents during Evaluation</figcaption>
</figure>

### Visualizing that Reward Difference

<div class="columns"><div class="column">
  <figure>
  <img src="figures/gif-CTLA-10s.png" style="width:100.0%" />
  <figcaption>Microscopic visualization of Fixed-Agent (10s per
  phase)</figcaption>
  </figure>
</div><div class="column">
  <figure>
  <img src="figures/gif-CTLA-60s.png" style="width:100.0%" />
  <figcaption>Microscopic visualization of Fixed-Agent (60s per
  phase)</figcaption>
  </figure>
</div></div>

### Visualizing that Reward Difference

<div class="columns"><div class="column">
  <figure>
  <img src="figures/gif-CLR.png" style="width:100.0%" />
  <figcaption>Microscopic visualization of Centralized Learning
  Agent</figcaption>
  </figure>
</div><div class="column">
  <figure>
  <img src="figures/gif-FedLR.png" style="width:100.0%" />
  <figcaption>Microscopic visualization of Federated Learning
  Agent</figcaption>
  </figure>
</div></div>

### Bibliography

 - [1] TuttoCitta. Map of Piazzale Lodi, Milan, Italy. TuttoCitt`a. Accessed: April 20, 2026. Screenshot by author. 2026. url: www.tuttocitta.it/mappa/milano/piazzale-lodi.
 - [2] Refolli Francesco. “Unconventional Reinforcement Learning on Traffic Lights with Sumo”. In: September 2025. url: https://github.com/frefolli/master-presentation.
 - [3] Toru Seo. “UXsim: lightweight mesoscopic traffic flow simulator in pure Python”. In: Journal of Open Source Software 10.106 (2025), p. 7617. doi: 10.21105/joss.07617. url: https://doi.org/10.21105/joss.07617.
 - [4] Takashi Nagatani. “The physics of traffic jams”. In: Reports on progress in physics 65.9 (2002), pp. 1331–1386.
 - [5] Corriere della Sera. Disegno del percorso della linea tranviaria circolare per Milano. 1973.
