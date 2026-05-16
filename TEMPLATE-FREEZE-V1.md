# BHARAT SERVE TECH — TEMPLATE FREEZE V1

## PURPOSE

This document defines the stabilized architecture rules for service pages.

Goal:

* Prevent architecture drift
* Maintain UI consistency
* Ensure scalable structure
* Avoid premature complexity

---

# SERVICE PAGE STANDARD

Every service page MUST contain:

1. Hero Section
2. Core Capabilities
3. Industry Challenges
4. Solution Framework
5. Service Modules
6. Industries Served
7. Technical Capabilities
8. Why Bharat Serve Tech
9. FAQ
10. CTA

---

# COMPONENT STANDARD

Approved reusable component:

* `.service-card`

Deprecated components:

* `.hero-feature`
* `.capability-card`
* `.solution-step`

These should NOT be reused.

---

# GRID STANDARD

Approved layout systems:

* `.hero-grid`
* `.capability-grid`
* `.solution-flow`

---

# STABILITY RULES

DO NOT introduce:

* CSS frameworks
* JavaScript frameworks
* animations
* page builders
* dynamic rendering
* CMS systems
* microservices
* API systems

until:

* structure is proven stable
* multiple service pages are validated
* SEO structure is stabilized

---

# DEVELOPMENT PRINCIPLES

1. Stabilize behavior before scaling
2. Make invalid state impossible
3. Reuse before expanding
4. One component system only
5. One spacing system only
6. One service structure only

---

# CURRENT STATUS

Template architecture stabilized:

* May 2026

Approved for controlled scaling.
