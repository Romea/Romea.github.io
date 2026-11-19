---
title: Simulation for field robotics
description: Choosing a simulator for robot control, perception and contact with natural environments.
author: m_ounally
resource_category: research-tools
order: 1
icon: fas fa-cubes
last_modified_at: 2026-11-19
---

Start with the question you need to test. A navigation experiment may need
realistic sensor data, while a study of wheel slip needs a suitable contact
and terrain model. These requirements lead to different simulation choices.

## Choosing a tool

| Tool | Useful for |
| --- | --- |
| [Gazebo](https://gazebosim.org/docs/latest/) | Testing ROS 2 systems, robot descriptions, controllers and sensor interfaces together. Check the supported ROS/Gazebo combination before setting up a project. |
| [Isaac Sim](https://docs.isaacsim.omniverse.nvidia.com/latest/) | Developing perception pipelines and scenes with rendered sensor data. Its RTX sensors require compatible NVIDIA hardware. |
| [Project Chrono](https://api.projectchrono.org/vehicle_terrain.html) | Studying vehicle dynamics and vehicle–terrain interaction. Its terrain models include deformable ground; choose and calibrate the formulation for the phenomenon being studied. |
| [MuJoCo](https://mujoco.readthedocs.io/en/stable/overview.html) | Working on articulated robot dynamics, contact and control. It provides a physics engine with C and Python interfaces. |
| [CropCraft](https://github.com/Romea/cropcraft) | Generating agricultural scenes for robotics experiments. It creates the field geometry; the simulator provides the dynamics and sensor models. |

For a ROS 2 project, first check that you can run the robot, publish its sensor
data and send a control command. For a contact study, first reproduce a small
experiment for which you have measurements. A detailed scene becomes useful
once the quantities needed for the study behave as expected.

## Build a useful experiment

- Keep the initial scene small. Add plants, terrain variation and sensor detail
  when they are needed to answer the research question.
- Check units, coordinate frames, timestamps, collision geometry and actuator
  limits before comparing controllers.
- Record the simulator version, robot model, solver settings, time step and
  random seeds with the results.
- Compare relevant signals with measurements from the robot: trajectories,
  tracking errors, forces, slip or power, depending on the study.
- Keep a simple reference experiment that can be run again after changing a
  model, dependency or controller.

## Describe what the model covers

When reporting an experiment, explain the robot, terrain, sensors and contact
models used. State which parameters were measured and which were assumed.
Discuss the effects that the simulation leaves out. This helps readers judge
what the results support and what still needs to be tested on a real robot.

The [Romea repositories](https://github.com/Romea) provide software for robot
interfaces, localisation and control.
