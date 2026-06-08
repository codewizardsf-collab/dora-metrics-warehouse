create view dora_service_metrics as
select
  s.service_name,
  s.owner_team,
  count(d.deployment_id) as deployment_count,
  avg(d.lead_time_minutes) as avg_lead_time_minutes,
  sum(case when d.status = 'failed' then 1 else 0 end) * 1.0 / nullif(count(d.deployment_id), 0) as change_failure_rate,
  avg(extract(epoch from (i.resolved_at - i.started_at)) / 60.0) as avg_restore_minutes
from services s
left join deployments d on d.service_id = s.service_id
left join incidents i on i.service_id = s.service_id
group by s.service_name, s.owner_team;
