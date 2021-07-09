import requests

resp = requests.get('https://raw.githubusercontent.com/cfacorp/helpdesk_incident_forecast_challenge/master/helpdesk_ticket_count.csv?token=AUKPE2QQRWDG6CSZA6CVT5LA4367M')
print(resp.raw)