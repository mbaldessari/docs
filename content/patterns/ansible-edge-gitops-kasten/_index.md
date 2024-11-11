---
title: Ansible Edge GitOps with Veeam Kasten
date: 2024-10-28
tier: sandbox
summary: This pattern uses OpenShift Virtualization to simulate an edge environment for VMs, protected by Veeam Kasten.
rh_products:
- Red Hat OpenShift Container Platform
- Red Hat Ansible Automation Platform
- Red Hat OpenShift Virtualization
- Red Hat Enterprise Linux
- Red Hat OpenShift Data Foundation
other_products:
- Veeam Kasten
industries:
- Chemical
aliases: /ansible-edge-gitops-kasten/
pattern_logo: veeam-kasten.png
links:
  install: getting-started
  help: https://groups.google.com/g/validatedpatterns
  bugs: https://github.com/validatedpatterns/ansible-edge-gitops/issues
# ci: aegitops
---

# Ansible Edge GitOps with Veeam Kasten

## Background

Organizations are interested in accelerating their deployment speeds and improving delivery quality in their Edge environments, where many devices may not fully or even partially embrace the GitOps philosophy. Further, there are VMs and other devices that can and should be managed with Ansible. This pattern explores some of the possibilities of using an OpenShift-based Ansible Automated Platform deployment and managing edge devices, based on work done with a partner in the Chemical space.

This pattern uses **OpenShift Virtualization** (the productization of KubeVirt) to provision VMs alongside Kubernetes-native workloads on the cluster. As VMs are inherently stateful workloads, a GitOps approach alone is not sufficient to recover an environment in the event of accidental data loss, malware attack, or infrastructure failure - especially in edge environments where infrastructure may be less resilient or subject to harsh environments. This example extends the standard [Ansible Edge GitOps pattern](https://validatedpatterns.io/patterns/ansible-edge-gitops/) to include automated deployment and configuration of [Veeam Kasten](https://www.veeam.com/products/cloud/kubernetes-data-protection.html), the #1 Kubernetes data protection and mobility solution.

### Solution elements

- How to use a GitOps approach to manage virtual machines, either in public clouds (limited to AWS for technical reasons) or on-prem OpenShift installations
- How to integrate AAP into OpenShift
- How to manage Edge devices using AAP hosted in OpenShift
- How to protect OpenShift Virtualzation VMs

### Red Hat Technologies

- Red Hat OpenShift Container Platform (Kubernetes)
- Red Hat Ansible Automation Platform (formerly known as "Ansible Tower")
- Red Hat OpenShift GitOps (ArgoCD)
- OpenShift Virtualization (KubeVirt)
- Red Hat Enterprise Linux 8

### Other Technologies this Pattern Uses

- Veeam Kasten
- Hashicorp Vault
- External Secrets Operator
- Inductive Automation Ignition

## Architecture

Similar to other patterns, this pattern starts with a central management hub, which hosts the AAP and Vault components. Veeam Kasten is deployed on each cluster it protects, providing a self-contained solution ideal for edge deployments without dependencies on external infrastructure or SaaS management plane.

### Logical architecture

![Ansible-Edge-Gitops-Architecture](/images/ansible-edge-gitops/ansible-edge-gitops-arch.png)

### Physical Architecture

![Ansible-Edge-GitOps-Physical-Architecture](/images/ansible-edge-gitops-kasten/aeg-arch-schematic.png)

## Other Presentations Featuring this Pattern

### Registration Required

[![Ansible-Automates-June-2022-Deck](/images/ansible-edge-gitops/automates-june-2022-deck-thumb.png)](https://tracks.redhat.com/c/validated-patterns_i?x=5wCWYS&lx=lT1ZfK)

[![Ansible-Automates-June-2022-Video](/images/ansible-edge-gitops/automates-june-2022-video-thumb.png)](https://tracks.redhat.com/c/preview-42?x=5wCWYS&lx=lT1ZfK)

## What's Next

- [Getting Started: Deploying and Validating the Pattern](getting-started)