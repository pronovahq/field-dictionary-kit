# Field tests

How to use this file: open a new chat in each place an agent reads the field dictionary,
and ask each question. If an answer differs from the expected answer, that agent isn't
reading the field dictionary.

These questions test the Acme Corp sample rows of the field dictionary template. Acme Corp is a
made-up services firm and every answer is illustrative. Replace the questions with ones
for your own fields.

## 1. A rep sent a proposal the buyer never asked for. Is that deal in Presentation scheduled?

- Expected answer: No. Deal stage is judged by what the buyer has done, not by what we sent. A deal enters Presentation scheduled when the buyer asked for a price.
- Other ways to ask it: We emailed a proposal on our own initiative. Does the deal move to Presentation scheduled?; A rep sent a price the buyer didn't ask for. Has the deal reached Presentation scheduled?
- Field it tests: HubSpot: Deal stage (dealstage)
- Checked by: not checked yet | Date: not checked yet

## 2. Which amount goes on the first invoice for a two-year deal?

- Expected answer: One year of Amount plus the setup fee, taken from the deal's line items. Amount holds the annual contract value in EUR, without VAT or setup fees, so on a two-year deal it holds one year, not the whole contract.
- Other ways to ask it: A client signed for two years. What do we bill them first?; What goes on the first invoice when a client signs a two-year contract?
- Field it tests: HubSpot: Amount (amount)
- Checked by: not checked yet | Date: not checked yet

## 3. A deal's close date is December 15. Is that the day the first invoice goes out?

- Expected answer: No. Close date is the date the buyer told us they expect to sign. It is not our target date and not the date the first invoice goes out.
- Other ways to ask it: Does Close date tell us when to send the first invoice?; Is Close date the date our rep is aiming for?
- Field it tests: HubSpot: Close date (closedate)
- Checked by: not checked yet | Date: not checked yet

## 4. Can you use Weighted amount to decide whether a deal counts toward Commit?

- Expected answer: No. HubSpot works it out as Amount times Deal probability, and Deal probability comes from the stage. It says nothing about what the buyer has done. Use Stage definitions instead.
- Other ways to ask it: A deal's Weighted amount is close to its Amount. Does that make it a Commit deal?; Which decides Commit, Weighted amount or the stage definitions?
- Field it tests: HubSpot: Weighted amount (hs_projected_amount)
- Checked by: not checked yet | Date: not checked yet

## 5. A deal's Deal health is Amber. What does that tell you?

- Expected answer: The buyer has gone quiet for two weeks. Deal health says how engaged the buyer is right now. It does not mean how big the risk is.
- Other ways to ask it: Does Amber mean a deal is a small risk?; What do we know about a buyer whose deal is marked Amber?
- Field it tests: HubSpot custom field: Deal health (deal_health)
- Checked by: not checked yet | Date: not checked yet

## 6. A deal's Contract length says annual. How long is the client committed?

- Expected answer: The field doesn't say. The value annual means billed once a year, so read the length from the order form.
- Other ways to ask it: Does annual in Contract length mean a one-year contract?; Contract length is annual. Is that a 12-month deal?
- Field it tests: HubSpot custom field: Contract length (contract_length)
- Checked by: not checked yet | Date: not checked yet

## 7. A client's Renewal date is 2027-03-31. Is that the day the contract ends?

- Expected answer: No. Renewal date is the last day the client can give notice, not the day the contract ends.
- Other ways to ask it: What does Renewal date mean for a client?; A client's Renewal date is next month. Does their contract end then?
- Field it tests: HubSpot custom field: Renewal date (renewal_date)
- Checked by: not checked yet | Date: not checked yet

## 8. An invoice in Xero has the Status AUTHORISED. Has the client paid any of it?

- Expected answer: The status doesn't say. AUTHORISED means approved and sent but not fully paid, and it also covers invoices that are only partly paid.
- Other ways to ask it: An invoice is AUTHORISED in Xero. Is it unpaid or partly paid?; Can you tell from the Status AUTHORISED whether a client has paid part of an invoice?
- Field it tests: Xero: invoice Status (Status)
- Checked by: not checked yet | Date: not checked yet

## 9. A project's status in Asana is complete. Has the client signed off?

- Expected answer: Asana doesn't say. The status complete means our delivery team has finished. It does not mean the client has signed off. For the client's sign-off, HubSpot is the source of truth.
- Other ways to ask it: Does complete in Asana mean the client accepted the work?; The delivery team marked a project complete in Asana. Does that tell you the client signed off?
- Field it tests: Asana: project status (current_status_update.status_type)
- Checked by: not checked yet | Date: not checked yet

## 10. Does a deal in Contract sent count toward this month's forecast?

- Expected answer: Toward Best case. It counts toward Commit only once the buyer has named a signing date in writing. If the order form isn't attached and no reply is logged, report the deal as stage not backed by evidence and leave it out of the forecast.
- Other ways to ask it: We sent the order form last week. Is that deal a Commit deal?; How should the Monday forecast count deals in Contract sent?
- Field it tests: Stage: Contract sent (contractsent)
- Checked by: not checked yet | Date: not checked yet

## 11. Does a deal in Decision maker bought-in count toward Commit?

- Expected answer: No. It counts toward Best case. If there is no note or email from the signer on the deal, report the deal as stage not backed by evidence and leave it out of the forecast.
- Other ways to ask it: A deal sits in Decision maker bought-in. Is it a Commit deal?; How does the forecast count a deal in Decision maker bought-in?
- Field it tests: Stage: Decision maker bought-in (decisionmakerboughtin)
- Checked by: not checked yet | Date: not checked yet

## 12. A rep moved a deal to Closed won after a verbal yes. Does it count as won?

- Expected answer: No. A deal enters Closed won when the signed order form is attached to the deal. Without it, report the deal as stage not backed by evidence and leave it out of the forecast.
- Other ways to ask it: What has to be on a deal before it counts as Closed won?; A deal is in Closed won with no signed order form attached. Do you count it?
- Field it tests: Stage: Closed won (closedwon)
- Checked by: not checked yet | Date: not checked yet
