# CRM field dictionary

A skill that tells your AI agents to read your team's field dictionary before any task on deals, forecasts, pipeline, invoices or renewals.

A field dictionary is one shared file that says what each field in your CRM, billing and project tools means in your team: its meaning, its allowed values, which tool to trust and who may change it. A connector gives an agent your records. The field dictionary tells it what they mean.

## Install

In Claude Code, run this in a session:

```
/plugin install crm-field-dictionary --marketplace pronovahq/field-dictionary-kit
```

In Codex, run these two lines in your shell:

```
codex plugin marketplace add pronovahq/field-dictionary-kit
codex plugin add crm-field-dictionary@pronova-field-dictionary-kit
```

## What the skill does

It has three modes, and it picks one from your request:

- Apply. Before a task that reads deal, forecast, pipeline, invoice or renewal data, the agent reads the field dictionary and follows its rules. In its answer it names the entries it used and lists the records it flagged.
- Build. The agent interviews you about one job, such as the Monday forecast, and drafts an entry for each field that job reads. It marks every guess until you confirm it.
- Check. The agent compares the field dictionary with the fields in your connected tools and lists what someone added, renamed or removed.

## What it needs

- Your field dictionary, saved as field-dictionary.md in the project's files, at the root of your repository, or attached to the chat. The skill folder holds template.md, a sample for Acme Corp, a made-up firm. The sample is illustrative and is not your field dictionary.
- A connector to your CRM, switched on, if you want the agent to read live records. Without one, the skill asks you to paste a field list or records.

## What it runs, sends and fetches

Nothing. The plugin holds instructions only: four Markdown files and an icon. It has no scripts, no hooks and no MCP servers, and it sends no data anywhere.

The agent reads your records through the connector you already use. The skill tells it to only read: never create, update or delete a record, and never call a tool that writes. It also tells the agent never to show the names of people or companies, email addresses or phone numbers. When you ask about your own deals, it may show a deal's name next to its record ID.

## Where to get the rest of the kit

The template, the test questions and a repository layout for teams that review every change are at https://github.com/pronovahq/field-dictionary-kit.

## License

MIT.
