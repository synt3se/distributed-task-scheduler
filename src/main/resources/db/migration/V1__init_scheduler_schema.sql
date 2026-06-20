create table if not exists jobs(
    id UUID PRIMARY KEY,
    type VARCHAR NOT NULL,
    payload JSONB NOT NULL,
    status VARCHAR NOT NULL,
    run_at TIMESTAMP NOT NULL,
    attempts INT NOT NULL,
    max_attempts INT NOT NULL,
    backoff_seconds INT NOT NULL,
    locked_by VARCHAR,
    locked_until TIMESTAMP,
    created_at TIMESTAMP NOT NULL,
    updated_at TIMESTAMP NOT NULL
);

create table if not exists job_executions (
    id UUID PRIMARY KEY,
    job_id UUID NOT NULL,
    worker_id VARCHAR NOT NULL,
    status VARCHAR NOT NULL,
    started_at TIMESTAMP NOT NULL,
    finished_at TIMESTAMP,
    error_message TEXT
);

create table if not exists dead_letter_jobs (
    id UUID PRIMARY KEY,
    original_job_id UUID NOT NULL,
    type VARCHAR NOT NULL,
    payload JSONB NOT NULL,
    reason TEXT,
    failed_at TIMESTAMP NOT NULL
)