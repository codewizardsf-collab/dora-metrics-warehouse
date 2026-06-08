create table services (
  service_id text primary key,
  service_name text not null,
  owner_team text not null
);

create table deployments (
  deployment_id text primary key,
  service_id text not null references services(service_id),
  commit_sha text not null,
  deployed_at timestamp not null,
  status text not null,
  lead_time_minutes integer not null
);

create table incidents (
  incident_id text primary key,
  service_id text not null references services(service_id),
  started_at timestamp not null,
  resolved_at timestamp,
  severity text not null
);
