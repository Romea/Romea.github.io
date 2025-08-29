---
title: "Feeling the Force: A New Way for Robots to Navigate Through Nature"
header:
  teaser: assets/images/research/feeling_the_force/teaser.png
---

<img src="assets/images/research/feeling_the_force/teaser.png" alt="tall grass" style="width:100%;">

Imagine a robot moving through a forest, brushing past tall grass and bending small branches as it advances. In structured environments like roads or factories, robots avoid obstacles at all costs. But in natural terrain, such as agricultural fields, forests, or green lands and meadows, avoiding every plant is not only impractical, it’s impossible. Sometimes, the most efficient path forward is *through* the vegetation.

So how do we teach robots when it’s safe to push ahead, and when they should stop?

In our recent paper, **["Feeling the Force: A Nuanced Physics-based Traversability Sensor for Navigation in Unstructured Vegetation"](https://arxiv.org/abs/2507.19831)**, we introduce a new sensor that allows robots to *feel* the resistance of plants in real time. Instead of just seeing obstacles, the robot can now sense how much force is required to move through them, enabling smarter, more adaptive navigation in complex natural environments.

### Why Vision Isn’t Enough
Most robotic navigation systems rely on cameras and lidar to detect obstacles. These tools are excellent at mapping geometry, but they can’t tell whether a bush is stiff or flexible. They see a wall of green and assume it’s impassable, even if it’s just tall grass that bends easily.

Some approaches use machine learning to predict traversability from visual cues. But without physical interaction, these models often fail in new environments or under changing conditions. Our solution? Give the robot a sense of touch.

### A Sensor That Feels the Pushback
We developed a lightweight, wire-based sensor mounted on the front of a mobile robot, as shown in the figure bellow. The sensor uses a thin wire held under constant tension. When the robot encounters vegetation, the plants push against the wire, causing it to retract slightly. By measuring this displacement with high precision, we can calculate the force applied by the plant, down to the gentle brush of a grass blade.

<img src="assets/images/research/feeling_the_force/fig2_sensor_mounted.png" alt="Custom force sensor mounted on robot" style="width:100%;">

Unlike traditional bumpers, which are often too stiff or noisy for soft vegetation, our design minimizes internal friction. This makes it sensitive enough to capture subtle interactions while remaining robust in real-world conditions.

### Mapping What the Robot Feels
As the robot moves, it builds a **force field map** of its surroundings. Each cell in the map stores the average resistance measured during traversal.

<img src="assets/images/research/feeling_the_force/fig6_force_field_map.png" alt="Force field map" style="width:100%;">

> **Force field map** of a grass patch. Brighter colors indicate higher resistance. The green dotted line shows the robot’s trajectory.

This goes beyond traditional binary maps (free vs. occupied). Now, the robot doesn’t just know *where* obstacles are—it knows how *hard* they’ll push back.

### Real-World Testing
We tested the sensor in outdoor environments:
- **Sapling:** Force peaked at **3 N**, capturing elastic bending and eventual yield.
- **Grass patch:** Fluctuating forces up to **4.3 N** reflected variations in density.

### Conclusion
In nature, navigation isn’t just about avoiding obstacles, it’s about knowing which ones you can safely move through. By giving robots the ability to *feel* their environment, we’re helping them move more naturally, efficiently, and intelligently through unstructured terrain.

This is more than better sensing. It’s a step toward robots that don’t just see the world—but understand it through touch.

*Read the full paper: [Feeling the Force: A Nuanced Physics-based Traversability Sensor for Navigation in Unstructured Vegetation](https://arxiv.org/abs/2507.19831)*

{% reference khizar2025feeling %}
