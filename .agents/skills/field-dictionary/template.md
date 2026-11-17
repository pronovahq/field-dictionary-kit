# Field dictionary: <team or pipeline name>

Jobs this dictionary serves: <one line per job, for example the Monday forecast; the closed-deal handoff>
Agents that read it: <for example Claude in the sales Project; the Breeze deal agent>
Owner: <the role that approves changes, for example whoever runs operations>
Last reviewed: <YYYY-MM-DD> | Version: <v1>

The example rows describe Acme Corp, a made-up services firm, and are illustrative.
Replace them with your own fields. Start with the fields your first job reads, and
add each new job's fields to this same file.

## Rules the agent follows on every run

1. If a field is empty, report it as empty. Don't fill in a guess.
2. If a value isn't in the field's allowed values, flag the record and don't use the value. Suggest an entry for the owner to approve.
3. If the task needs a field this dictionary doesn't define, say so and ask before you use it.
4. If two tools hold different values for the same thing, use the source of truth named below and mention the other value.
5. Never change a field marked Read only. For a field marked Agent proposes, a person approves, describe the change and wait for that person.
6. Never add or change an entry in this dictionary yourself. Suggest it to the owner.
7. In your answer, name every record you skipped or flagged and why.
8. If a field's meaning starts with DRAFT, treat the field as undefined and follow rule 3. A draft is a guess nobody has confirmed yet.

## Fields

Field = the tool, the label people use and the internal name the connector returns.
Who may change it = a named role, Agent proposes, a person approves, or Read only.

| Field | What it means here | Allowed values | Source of truth | Who may change it | Example |
|---|---|---|---|---|---|
| HubSpot: Deal stage (dealstage) | Where the buyer is in our sales process, judged by what the buyer has done, not by what we sent. | The stages in Stage definitions below | HubSpot | Deal owner; agent proposes, a person approves | contractsent |
| HubSpot: Amount (amount) | The annual contract value in EUR, without VAT or setup fees. Our admin set HubSpot to fill Amount with the annual value, so on a two-year deal it holds one year, not the whole contract. The first invoice is one year of Amount plus the setup fee, taken from the deal's line items. | A number | HubSpot until Closed won, then Xero | Deal owner until Closed won, then whoever handles invoicing | 24000 |
| HubSpot: Close date (closedate) | The date the buyer told us they expect to sign. It is not our target date and not the date the first invoice goes out. | A date. Must not be in the past on an open deal | HubSpot | Deal owner; agent proposes, a person approves | 2026-12-15 |
| HubSpot: Weighted amount (hs_projected_amount) | HubSpot works it out as Amount times Deal probability, and Deal probability comes from the stage. It says nothing about what the buyer has done, so don't use it to decide commit. Use Stage definitions instead. | A number, calculated by HubSpot | HubSpot | Read only | 21600 |
| HubSpot custom field: Deal health (deal_health) | How engaged the buyer is right now. It does not mean how big the risk is. | Green = the buyer replied in the last 14 days. Amber = the buyer has gone quiet for two weeks. Red = the buyer said the timing moved. Any other value: flag it | HubSpot | Deal owner; agent proposes, a person approves | Amber |
| HubSpot custom field: Contract length (contract_length) | How long the client is committed. Reps type it as text, so the values below are the spellings already in use. | 12 months or 1 yr = one year. annual = billed once a year; read the length from the order form. 2+1 = two years with an optional third. Any other value: flag it | HubSpot | Deal owner | 2+1 |
| HubSpot custom field: Renewal date (renewal_date) | The last day the client can give notice, not the day the contract ends. | A date | HubSpot | Account manager; agent proposes, a person approves | 2027-03-31 |
| Xero: invoice Status (Status) | AUTHORISED means approved and sent but not fully paid, and it also covers invoices that are only partly paid. | DRAFT, SUBMITTED, AUTHORISED, PAID, VOIDED, DELETED | Xero | Finance only; read only for agents | AUTHORISED |
| Asana: project status (current_status_update.status_type) | complete means our delivery team has finished. It does not mean the client has signed off. | on_track, at_risk, off_track, on_hold, complete, dropped | Asana for delivery; HubSpot for the client's sign-off | Whoever schedules delivery | complete |

## Stage definitions: <pipeline name>

A stage name usually says what we did. The agent needs to know what the buyer did, so
each stage says what has to be true to enter and to leave it, and what the agent can check.
Internal IDs: copy each stage's internal name from your pipeline settings. The ones below
are the default pipeline's. A stage you add gets a number as its ID unless an admin sets one.

| Stage (internal ID) | Enter when this is true | Leave when this is true | Evidence the agent can check | Counts toward |
|---|---|---|---|---|
| Appointment scheduled (appointmentscheduled) | The buyer agreed to a first call about a named problem | We know the problem, who decides and which tools are involved | A meeting logged on the deal | Pipeline |
| Qualified to buy (qualifiedtobuy) | The buyer confirmed budget and who signs | The buyer asked for a proposal | A note naming the signer | Pipeline |
| Presentation scheduled (presentationscheduled) | The buyer asked for a price | The buyer has the written proposal | Proposal file or email on the deal | Pipeline |
| Decision maker bought-in (decisionmakerboughtin) | The person who signs has seen the price and said yes in principle | The order form goes out | A note or email from the signer | Best case |
| Contract sent (contractsent) | The order form is with the buyer | The buyer's legal team or signer has replied | Order form attached; reply logged | Best case. Commit only once the buyer has named a signing date in writing |
| Closed won (closedwon) | The signed order form is attached to the deal | Never; the handoff starts | Signed PDF on the deal | Closed won |
| Closed lost (closedlost) | The buyer said no, or didn't reply for 30 days after two follow-ups | Never | Closed lost reason filled in | Not forecasted |

If the evidence for a deal's stage isn't there, report the deal as stage not backed by
evidence and leave it out of the forecast.
