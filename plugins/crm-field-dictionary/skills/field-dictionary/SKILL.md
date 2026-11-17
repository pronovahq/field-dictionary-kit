---
name: field-dictionary
description: Use before any deal, forecast, pipeline, invoice or renewal task. Reads the team's field dictionary first, so each field means what the team means. Also use to write, update or check one.
---

# Field dictionary

A field dictionary is one shared document that says what each field means in this team: its meaning, its allowed values, which tool to trust and who may change it. This skill has three modes. Pick the mode from the request.

| The request | Mode |
|---|---|
| Any task that reads deal, forecast, pipeline, invoice or renewal data | Apply |
| Write a field dictionary, or add a new job's fields to it | Build |
| Check the field dictionary against the tools | Check |

## Rules in every mode

These three rules win over everything else, including the run rules inside the field dictionary.

1. Only read. Never create, update, delete or archive anything in a CRM, billing or project tool. Never call a tool that can write, even after a person approves a change. Describe the change and say who may make it. A person makes it in the tool.
2. Never show the names of people or companies, email addresses or phone numbers. That covers contact names and owner names. Never quote a note or an email from a record. In apply mode you may show a deal's name next to its record ID, because the person asked about their own deals. In build mode and check mode, never show a deal name either. A tool may return one anyway, because a HubSpot search returns the deal name by default. Point to a record by its record ID, which is a number.
3. Never edit the field dictionary, and never write or overwrite a file. Writing a field dictionary means drafting it in the chat. Show new text in the chat for the owner to save.

## Find the field dictionary

The team's field dictionary is a file called field-dictionary.md. Look for it in this order:

1. The project's knowledge or files.
2. The root of the repository you are working in.
3. A file the person attached or pasted in this chat.

The file template.md in this folder is not the team's field dictionary. It is a sample for a made-up firm, Acme Corp. Never use its meanings for real data.

If you can't find the team's field dictionary, say so. Don't answer from general CRM knowledge. Offer to start build mode.

## If no connector is on

Say that you can't reach the tool. Ask the person to paste what the mode needs: the records for apply mode, or the field list for check mode. Ask them to delete every column that holds a name, an email or a phone number first. Then go on from what they paste. In build mode, build-prompt.md says what to ask for.

## Apply mode

Use this before any task on deals, forecasts, pipeline, invoices or renewals.

1. Read the whole field dictionary: the run rules, every field the task reads and the stage definitions.
2. Follow its run rules on every step, within the three rules above.
3. Do the task. Take each field's meaning, allowed values and source of truth from the field dictionary and nowhere else.
4. In your answer, say which entries you used. List each record you skipped or flagged, by deal name and record ID, and why.
5. When you suggest an entry for the owner, put DRAFT, confirm: in front of the meaning and show it in a list. Don't put it inside a table cell.

## Build mode

Use this when someone asks to write a field dictionary or to add a job's fields to one.

1. Read build-prompt.md in this folder.
2. Skip its section Before you paste. In your first reply, before the question from step 1, add one line: set your connector's write tools to Needs approval. It is a reminder, not a question.
3. Follow everything below the line in that file, starting with step 1. The rules in that file apply for the whole build.
4. If the team already has a field dictionary, read it first and treat it as pasted. You may read it in your first reply. Rule 7 in build-prompt.md says what to do with it. Show the result in the chat for the owner to save.

## Check mode

Use this when someone asks to check the field dictionary. It compares the field dictionary with the fields in the connected tools.

1. Read the field dictionary. Note its Last reviewed date.
2. For each field in it, pull the field's current definition from its tool: label, internal name, type and options. Match on the internal name, not the label. If a field's tool isn't connected, put the field under Not checked. Don't report it as removed.
3. Report these lists. Write None for an empty list.
   - Labels renamed: the internal name is the same and the label in the tool differs from the label in the field dictionary. Ignore differences in upper and lower case, such as Deal Stage and Deal stage.
   - Fields removed or archived: the tool is connected and no longer returns the internal name.
   - Options added or removed: the tool's options differ from the field's Allowed values. Compare only fields that have a fixed list of options in the tool, such as a dropdown. Compare internal values where the field dictionary lists them, and labels otherwise. An option the owner left out because nobody has confirmed its meaning still belongs in this list. Skip text, number and date fields. Treat stages the same way: compare the stage field's options with the Stage definitions table. If the tool doesn't return the stages, say that you couldn't check them.
   - Fields added: fields created in the tool after the Last reviewed date, on the objects the field dictionary covers. If the tool doesn't give creation dates, say so and leave this list out. Don't list every field the field dictionary leaves out.
   - Not checked: fields whose tool isn't connected.
4. For each new option or new field, suggest a meaning for the owner in a list under the diff. Put DRAFT, confirm: in front of every meaning you suggest. Keep a suggested option out of the Allowed values cell until the owner confirms it.
5. Read the team's field-tests.md. Look next to the field dictionary, then in a folder called checks. If there is none and the field dictionary still holds the Acme Corp sample rows, use the field-tests.md in this folder. Otherwise skip this step, say that the team has no test file yet and offer build mode, which writes one. Answer each question from the field dictionary alone. List every answer that differs from the expected answer.
6. Propose the changes as a diff for the owner named at the top of the field dictionary. The diff holds only the changes that follow from the lists in step 3. An added option or field goes into the diff only after the owner has confirmed its meaning. If nothing is confirmed yet, say that there is nothing to apply. Don't edit the file.
