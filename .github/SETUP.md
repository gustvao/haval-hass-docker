# GitHub Actions Setup Instructions

To enable automatic building and pushing of Docker images, you need to set up the following secrets in your GitHub repository:

1. Go to your repository on GitHub
2. Click on "Settings"
3. Click on "Secrets and variables" → "Actions"
4. Add the following secrets:

## Required Secrets

| Secret Name | Description |
|-------------|-------------|
| `DOCKERHUB_USERNAME` | Your Docker Hub username |
| `DOCKERHUB_TOKEN` | Your Docker Hub access token (not your password) |

## How to create a Docker Hub access token

1. Log in to [Docker Hub](https://hub.docker.com/)
2. Click on your username → "Account Settings" → "Security"
3. Click "New Access Token"
4. Give it a description (e.g., "GitHub Actions")
5. Select the appropriate permissions (typically "Read & Write")
6. Copy the token and add it as a secret in your GitHub repository

## Verifying the setup

After adding the secrets:

1. Go to the "Actions" tab in your repository
2. Click on the "Build and Push Docker Image" workflow
3. Click "Run workflow" → "Run workflow"
4. The workflow should now run and push the image to Docker Hub

If you encounter any issues, check the workflow logs for error messages. 