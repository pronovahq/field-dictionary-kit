# Field dictionary interview prompt

Paste this whole file into a new Claude chat. Claude asks for your job first. Then it works through the fields that job uses and ends with your field dictionary and a set of test questions.

Copy everything, including this section. The connector is optional. With it, Claude counts your records. Without it, Claude asks you for a field list.

## Before you paste

1. Set the connector's write tools to Needs approval. In Claude, go to Customize, then Connectors, and select your CRM connector. Under Tool permissions, choose Needs approval for the write tools. Do the same for every other connector you switch on, such as your billing tool or project tool. On a Team or Enterprise plan, an owner may have set this for everyone already.
2. Turn on the connector in a new chat. Select + in the message box, select Connectors and switch on your CRM. If you have connectors for your billing tool or project tool, switch those on too.
3. Paste this file. The prompt tells Claude to only read. The setting from step 1 adds a second lock: nothing can change in your tools unless you approve it, and you approve nothing in this chat.

No connector? Skip steps 1 and 2 and paste the prompt anyway. Claude asks you for a field list and tells you how to export one. Before you paste that list, delete the Created user column, because it holds a person's name.

Adding a second job? When Claude asks for the job, paste or attach your current field-dictionary.md with your answer.

What you see in the chat is counts, field names and field values. Claude doesn't show the names of deals, companies or people, and it doesn't show emails.

To cross-check the empty counts in HubSpot, open Data Management, then Data Model, then the Health tab. It flags fields with a low fill rate.

The kit's examples use Acme Corp and Testco, which are made up and illustrative.

---

You are helping me write a field dictionary: one shared document that says what each field means in my team, for the AI agents that read our tools. Work through the steps below in order.

## Rules for this whole chat

1. Only read. Never create, update, delete or archive anything in any connected tool, even if I ask for it later in this chat. Never call a tool that can write. If a step seems to need a write, stop and tell me what you would have changed.
2. Never show names or emails. That covers deal names, company names, contact names, owner names, email addresses and phone numbers. Don't request those fields from a tool. A tool may return a name anyway, because a HubSpot search returns the deal name by default. Never repeat it. When you report on records, give numbers, field names and field values only. To point me to one record, use its record ID, which is a number. If a field's value looks like the name or email of a person or company, count it and don't show it.
3. Ask one question per turn, then wait for my answer.
4. Mark every guess. Any meaning, source of truth or permission I haven't confirmed starts with DRAFT, confirm: and keeps that marker until I confirm it. When you show me a table of guesses, point to the rows you are least sure about, three at most, and ask me to look at those first. In the final file, DRAFT, confirm: comes at the very start of a cell and never in the middle. If I confirmed the main meaning and only an extra detail is unconfirmed, leave that detail out of the cell and add it to the list in step 9.
5. Use my team's words, not general CRM definitions. If my answer doesn't fit what the data shows, tell me and ask which is right.
6. Keep each meaning to one or two sentences. Include what the field doesn't mean.
7. If I paste or attach my existing field dictionary, keep its entries as they are and work only on the new job's fields. In step 9, give me the whole file with the new entries added, the new job on the jobs line, today's date and the next version number.

## Step 1: ask for the job

In your first reply, ask me to describe the job in one sentence. Give one example: every Monday, list the deals likely to close this month and what's blocking each one. Ask nothing else and call no tools in that reply.

## Step 2: list the fields the job uses

If a connector is on, pull the definition of each field the job reads, from every connected tool. For each field show:

- the label people see
- the internal name the connector returns
- the field type
- every option the field allows, including options no record uses yet
- the existing description, if the tool holds one

Show this as a table. Aim for 8 to 15 fields. Include the custom fields the job could read, not only the tool's standard fields. A custom field is one my team created. Then ask me which fields to add or remove, and wait. If I add a field, pull its definition and show me the updated table before you count.

If no connector is on, ask me to paste a field list, and tell me how to get one:

- In HubSpot: open Settings, then Properties, and click Export all properties in the upper right. Select the object, for example deals, and export. HubSpot sends the file by email. Delete the Created user column, because it holds a person's name. Then paste the rows for the fields this job uses, or the whole file if that is easier. The file holds each field's name, internal name, type, description, options and fill rate.
- In another tool: export the field settings, or copy the field's settings page with its label, internal name, type and options.

Then build the same table from what I paste and ask me which fields to add or remove.

## Step 3: count, without listing records

For each field I keep, report across all records of that object, open and closed, not a sample:

- how many records there are
- how many have no value in that field
- how many of those are open records, where the object has open and closed records. An open deal is one that is not in a closed won or closed lost stage
- for a dropdown or a typed text field, each value in use and how many records hold it

How to count:

- For empty values, search with a filter for the field having no value and read the total the search returns. In HubSpot the filter operator is NOT_HAS_PROPERTY. Ask for the smallest page of results and use only the total. Never read through records to count empty values.
- For a dropdown, filter on each option and read the total. The option counts plus the empty count should add up to the number of records. If they don't, say so. If a field lets a record hold more than one option, the counts can add up to more. Say that instead of reporting a mismatch.
- A typed text field is the one exception to reading records, because you can't know its values in advance. Group by value if the tool can. If it can't, read that one field from every record that has a value, page until you have covered them all, and say how many records you read. Request only that one field. Before you show a value from a text field, check it for the name of a person or company, an email or a phone number. If it holds one, count it and don't show it.
- For a field that holds a name, such as the deal name or the deal owner, give the empty count only. Never list its values.
- If the tool returns no total, or you can only check a sample, say so and say how many records you checked.

Also check each date field that should be in the future on an open record, such as the close date on an open deal. Report how many open records have a date in the past, with the record ID, the stage and the date for each one, and no name. Say which date you used as today.

Show the counts as one table: field, records, empty, empty on open records, values in use. Then go on to step 4 in the same reply.

If no connector is on, say that you can't count without records. If my pasted field list has a fill rate column, report that figure exactly as HubSpot gives it and say it is HubSpot's own. Don't turn it into a count or into a share of empty records. Then offer me two choices: skip the counts, or paste a record export after I delete every column that holds a name, an email or a phone number. Wait for my choice before step 4.

## Step 4: draft each entry, one field at a time

Take the fields one at a time. For each field:

1. Show a draft entry with the six parts from the format below. Start from the tool's existing description if there is one. Mark what you guessed with DRAFT, confirm:
2. Ask me one question: the one whose answer you most need to get the meaning right. For a dropdown or text field, list every option the field allows and every value in use, and ask what each means in my team. That counts as one question.
3. Wait for my answer, update the entry, then move to the next field. Never ask about two fields in one turn.

For Example, use a value from the records or one I gave you. If the counts in step 3 didn't show you a value, read that one field from one record that has a value. Never do this for a field that holds a name, an email or a phone number. Don't use a date in the past on an open record. In the final file, don't use a value that isn't in Allowed values. If you still have no value, write To fill in. Never make one up.

Allowed values holds only the values whose meaning I gave or confirmed. If an option exists or a value is in use and I haven't confirmed a meaning for it, leave it out of Allowed values and add it to the list in step 9, even if you drafted a meaning for it.

## Step 5: draft the stage table

Draft one row for every stage of the pipeline this job uses. Each row holds the stage's label and internal ID, what has to be true to enter it and what has to be true to leave it. It also holds the evidence an agent can check in the tool and what the stage counts toward. Use HubSpot's forecast categories for the last column unless my CRM uses other names: Pipeline, Best case, Commit, Closed won, Not forecasted. Put DRAFT, confirm: in front of every cell you guessed. Show the whole table and ask me to correct it, then wait.

## Step 6: ask which tool to trust

List every field that a second tool also holds, such as an amount that sits in both the CRM and the billing tool. Include tools that aren't connected, and ask me if you can't tell. For each field, show your guess at which tool to trust and from when. Ask me to correct the list, then wait.

## Step 7: ask who may change each field

Show one table with every field and your guess at who may change it. Use one of three forms: a named role, Agent proposes, a person approves, or Read only. Add one last row for the field dictionary itself: who owns it and approves changes. Ask me to correct the table, then wait.

## Step 8: send me to my colleagues

Before you write the final files, list the meanings I should check with the colleague who enters that data, and say who that probably is for each field. For example, sales reps know whether a close date is the buyer's date or their own target, and whoever sends the invoices knows from when the billing tool holds the right amount. Ask me to come back with their corrections, then wait. Anything I don't confirm in this chat, for myself or after asking them, keeps its DRAFT, confirm: marker.

## Step 9: produce the files

End with three things, in this order, all shown in the chat. Data to look at comes first, before both files.

First, a short list called Data to look at. Don't fix any of it. It is for the owner of each field.

- every field that is empty on at least one record, with the counts for all records and for open records
- options and values in use that have no meaning in the field dictionary
- open records with a date in the past, by record ID
- details I haven't confirmed, which you left out of a meaning

Second, the field dictionary, in one code block, ready to save as field-dictionary.md. Use this exact format. Replace everything in square brackets. If I haven't given you a header value, write To fill in.

```markdown
# Field dictionary: [team or pipeline name]

Jobs this dictionary serves: [the job, in my one sentence]
Agents that read it: [the agents I named, or To fill in]
Owner: [the role from step 7]
Last reviewed: [today's date as YYYY-MM-DD] | Version: [v1, or the next version number if I gave you an existing file]

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
| [Tool: Label (internal_name)] | [meaning, with DRAFT, confirm: in front if I haven't confirmed it] | [each value and what it means. Any other value: flag it] | [tool, and from when if it changes] | [one of the three forms] | [one real value, never a name or an email] |

## Stage definitions: [pipeline name]

A stage name usually says what we did. The agent needs to know what the buyer did, so
each stage says what has to be true to enter and to leave it, and what the agent can check.

| Stage (internal ID) | Enter when this is true | Leave when this is true | Evidence the agent can check | Counts toward |
|---|---|---|---|---|
| [Label (internal ID)] | [what is true] | [what is true] | [what the agent can check] | [forecast category] |

If the evidence for a deal's stage isn't there, report the deal as stage not backed by
evidence and leave it out of the forecast.
```

Third, the test questions, in one code block, ready to save as field-tests.md. Write one question per field and one per stage that counts toward the forecast. Take each expected answer from the field dictionary and nowhere else. Pick questions an agent would get wrong if it guessed. Each other way to ask it is the same question in different words, so the same expected answer fits it. If a field's meaning is still a draft, the expected answer is that the field isn't defined yet and the agent asks before using it. Use this exact format:

```markdown
# Field tests

How to use this file: open a new chat in each place an agent reads the field dictionary,
and ask each question. If an answer differs from the expected answer, that agent isn't
reading the field dictionary.

## 1. [the question]

- Expected answer: [the answer the field dictionary gives]
- Other ways to ask it: [a second wording of the same question]; [a third wording of the same question]
- Field it tests: [Tool: Label (internal_name), or the stage]
- Checked by: not checked yet | Date: not checked yet
```
