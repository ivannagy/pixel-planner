# Pixel Commerce - High Level Plan

## Project Timeline (Phases)

```text
                                                                                  ┌─→ 2025-08-29 (6% / 35%)
- Phase 01 – Project Initiation      W 31-34 2025-08-01 to 2025-08-20 ▼ → [■ ■ ■ ■|                                 25% / 100%
- Phase 02 – Infrastructure Setup    W 35-39 2025-08-25 to 2025-09-25 ▼ →         |■ ■ ■ ■ ■]                       0% / 50%
- Phase 03 – Application Development W 40-46 2025-10-01 to 2025-11-12 ▲ →         |         [■ ■ ■ ■ ■ ■ ■]         0% / 0%
- Phase 04 – Launch                  W 48-50 2025-11-25 to 2025-12-10 ▲ →         |                         [■ ■ ■] 0% / 0%
```

## Milestone Status Overview

```text
- Backlog          : 14 → [■ ■ ■ ■ ■ ■ ■ ■] 82%
- Done             : 01 → [■] 6%
- In Progress      : 01 → [■] 6%
- Ready for Review : 01 → [■] 6%
```

## Phase 01 – Project Initiation

| **Milestone**           | **Description**                                           | Status           | Baseline Plan | Current Plan | Assignee | Comments |
| ----------------------- | --------------------------------------------------------- | ---------------- | ------------- | ------------ | -------- | -------- |
| Kickoff meeting         | Formal kickoff with all stakeholders and project charter. | Done             | 2025-08-01    | 2025-08-01   | PM       |          |
| Stakeholder alignment   | Confirm scope, success criteria, and constraints.         | Ready for Review | 2025-08-05    | 2025-08-05   | PM       |          |
| Requirements finalized  | BRD finalized; acceptance criteria approved.              | In Progress      | 2025-08-15    | 2025-08-18   | PM       |          |
| Risk register created   | Risks, mitigations, and owners captured and agreed.       | Backlog          | 2025-08-20    | 2025-08-20   | PM       |          |

---

## Phase 02 – Infrastructure Setup

| **Milestone**                 | **Description**                                        | Status   | Baseline Plan | Current Plan | Assignee | Comments |
| ----------------------------- | ------------------------------------------------------ | -------- | ------------- | ------------ | -------- | -------- |
| Cloud account provisioning    | Create org units, accounts, and billing alerts.        | Backlog  | 2025-08-21    | 2025-08-25   | DevOps   |          |
| Network & IAM foundations     | VPC, subnets, routing, IAM roles and policies.         | Backlog  | 2025-08-28    | 2025-09-02   | DevOps   |          |
| CI/CD pipeline skeleton       | Repos, runners, branch protections, basic pipeline.    | Backlog  | 2025-09-06    | 2025-09-09   | DevOps   |          |
| Monitoring & logging baseline | Metrics, logs, dashboards, and alerting in place.      | Backlog  | 2025-09-15    | 2025-09-25   | DevOps   |          |

---

## Phase 03 – Application Development

| **Milestone**          | **Description**                                            | Status   | Baseline Plan | Current Plan | Assignee | Comments |
| ---------------------- | ---------------------------------------------------------- | -------- | ------------- | ------------ | -------- | -------- |
| Backend scaffolding    | Service skeleton, health checks, observability wiring.     | Backlog  | 2025-09-26    | 2025-10-01   | Backend  |          |
| Frontend scaffolding   | App shell, routing, and shared UI components.              | Backlog  | 2025-09-29    | 2025-10-03   | Frontend |          |
| Core features v1       | CRUD + auth flows behind feature flags.                    | Backlog  | 2025-10-10    | 2025-10-25   | Backend  |          |
| API contract freeze    | OpenAPI finalized, versioned, and published.               | Backlog  | 2025-10-20    | 2025-10-22   | Backend  |          |
| E2E happy path         | First green E2E scenario running in CI.                    | Backlog  | 2025-11-10    | 2025-11-12   | QA       |          |

---

## Phase 04 – Launch

| **Milestone**    | **Description**                                | Status   | Baseline Plan | Current Plan | Assignee | Comments |
| ---------------- | ---------------------------------------------- | -------- | ------------- | ------------ | -------- | -------- |
| UAT complete     | UAT sign-off from business stakeholders.       | Backlog  | 2025-11-22    | 2025-11-25   | QA       |          |
| Security review  | Threat model and penetration test passed.      | Backlog  | 2025-11-28    | 2025-12-03   | Security |          |
| Go-live          | Production release and smoke tests passed.     | Backlog  | 2025-12-05    | 2025-12-05   | PM       |          |
| Post-mortem      | Blameless retrospective and action items.      | Backlog  | 2025-12-10    | 2025-12-10   | PM       |          |

---

## Project Baseline v1.0

```text
- Phase 01 – Project Initiation      W 31-34 2025-08-01 to 2025-08-20 ▲ → [■ ■ ■ ■]                                
- Phase 02 – Infrastructure Setup    W 34-38 2025-08-21 to 2025-09-15 ▲ →       [■ ■ ■ ■ ■]                        
- Phase 03 – Application Development W 39-46 2025-09-26 to 2025-11-10 ▲ →                 [■ ■ ■ ■ ■ ■ ■ ■]        
- Phase 04 – Launch                  W 47-50 2025-11-22 to 2025-12-10 ▲ →                                 [■ ■ ■ ■]
```

## Project Baseline v1.1

```text
- Phase 01 – Project Initiation      W 31-34 2025-08-01 to 2025-08-20 ▲ → [■ ■ ■ ■]                                 25% / 100%
- Phase 02 – Infrastructure Setup    W 34-38 2025-08-21 to 2025-09-15 ▲ →       [■ ■ ■ ■ ■]                         0% / 100%
- Phase 03 – Application Development W 39-46 2025-09-26 to 2025-11-10 ▲ →                 [■ ■ ■ ■ ■ ■ ■ ■]         0% / 100%
- Phase 04 – Launch                  W 47-50 2025-11-22 to 2025-12-10 ▲ →                                 [■ ■ ■ ■] 0% / 100%
```
