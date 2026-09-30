## System Architecture

- **Base Image**: Ubuntu 22.04 LTS (minimal)
- **Package Management**: APT for essential system packages
- **Container Runtime**: Docker (v28.1.1)
- **Resource Management**: Docker Compose for multi-container applications
- **Networking**: Docker internal networks and external port mapping

## Technology Stack

- **Server Infrastructure**: Docker containers for all application services
- **Storage**: Docker volumes for persistence
- **Monitoring**: Prometheus + Grafana (deployed via Docker)
- **Logging**: ELK stack (Elasticsearch + Logstash + Kibana via Docker)

## Core Practices

1. **Container-First Design**: All applications must run in Docker containers
2. **Immutable Infrastructure**: No server-side installations of runtime languages
3. **Resource Isolation**: Each service runs in its own isolated container
4. **Port Management**: All services exposed via Docker port mapping
5. **Data Persistence**: Docker volumes for persistent storage needs

## CI/CD Pipeline

- **Build**: Docker multi-stage builds
- **Testing**: Container-based test environments
- **Deployment**: Docker registry integration
- **Rollback**: Container image versioning and rollbacks

## Security

- **Principle of Least Privilege**: Minimal container capabilities
- **Network Segmentation**: Docker networks isolate services
- **Regular Updates**: Base OS and Docker updates
- **Access Control**: SSH for administrative access only

## Operational Guidelines

- Use Docker commands: `docker build`, `docker run`, `docker compose`
- Never install system packages for application runtimes
- All configurations managed via Docker volumes
- Container logs accessed via `docker logs`
- Monitoring via container metrics and host system metrics