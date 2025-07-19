# 🔔 Slack Notification Integration for GitHub Environments

GitHub does not natively send email alerts for pending environment approvals.
Use the GitHub Slack App or Webhooks to get alerts.

### Slack Webhook Example:
```yaml
- name: Notify Slack
  run: |
    curl -X POST -H 'Content-type: application/json' \
    --data '{"text":"⚠️ Deployment awaiting approval."}' \
    ${{ secrets.SLACK_WEBHOOK }}
```