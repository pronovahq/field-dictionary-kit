# Field dictionary kit

This repository holds one team's field dictionary: field-dictionary.md at the root.

Before any task on deals, forecasts, pipeline, deal handoffs, invoices or renewals:

1. Read field-dictionary.md in full, including its run rules and stage definitions.
2. Read the file in jobs/ for the task, if there is one.
3. Follow the run rules on every step.
4. If the task needs a field that field-dictionary.md doesn't define, stop and ask. Don't guess its meaning.

Rules that always apply:

- Only read from CRM, billing and project tools. Never create, update, delete or archive a record.
- Never edit field-dictionary.md yourself. Show the change as a diff. A person opens the pull request and the owner approves it.
- Never show the names of people or companies, email addresses or phone numbers. In an answer about deals you may show a deal's name next to its record ID.
- If field-dictionary.md still holds the line that starts The example rows describe Acme Corp, it is the unedited sample. Say so before you answer.
- Never put a credential, token or connector setting in this repository.

The field-dictionary skill in this repository has three modes: apply, build and check.
