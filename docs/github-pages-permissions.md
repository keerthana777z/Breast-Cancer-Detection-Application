# GitHub Pages Permissions Setup

This document explains how to set up the correct permissions for GitHub Pages deployment.

## Fix Permission Issues for GitHub Actions

If you encounter a permission error like this:

```
remote: Permission to username/repository.git denied to github-actions[bot].
fatal: unable to access 'https://github.com/username/repository.git/': The requested URL returned error: 403
```

Follow these steps to fix it:

### 1. Update Repository Settings

1. Go to your GitHub repository
2. Click on "Settings" (tab at the top)
3. In the left sidebar, click on "Actions" under "Code and automation"
4. Scroll down to the "Workflow permissions" section
5. Select "Read and write permissions"
6. Check "Allow GitHub Actions to create and approve pull requests"
7. Click "Save"

![Workflow Permissions](https://user-images.githubusercontent.com/10623301/179395570-8f2e6d7a-b6c1-4fae-9f9c-6e5f9f7121f9.png)

### 2. Configure GitHub Pages

1. Go to your GitHub repository
2. Click on "Settings" (tab at the top)
3. In the left sidebar, click on "Pages" under "Code and automation"
4. Under "Build and deployment", select "Deploy from a branch" as the Source
5. Select "gh-pages" as the branch
6. Click "Save"

### 3. Re-run the Workflow

1. Go to the "Actions" tab in your repository
2. Find the failed workflow run
3. Click on "Re-run all jobs" to try again

## Alternative: Use a Personal Access Token

If you still encounter permission issues, you can use a Personal Access Token (PAT) instead:

1. Go to your GitHub account settings
2. Click on "Developer settings" (at the bottom of the left sidebar)
3. Click on "Personal access tokens" and then "Tokens (classic)"
4. Click "Generate new token" and then "Generate new token (classic)"
5. Give it a name (e.g., "GitHub Pages Deployment")
6. Select the "repo" scope
7. Click "Generate token"
8. Copy the token (you won't be able to see it again)

9. Go to your repository settings
10. Click on "Secrets and variables" under "Security"
11. Click on "Actions"
12. Click "New repository secret"
13. Name: `PERSONAL_ACCESS_TOKEN`
14. Value: Paste the token you copied
15. Click "Add secret"

16. Update your workflow file to use the PAT:

```yaml
- name: Deploy to GitHub Pages
  uses: JamesIves/github-pages-deploy-action@v4
  with:
    folder: demo
    token: ${{ secrets.PERSONAL_ACCESS_TOKEN }}
    branch: gh-pages
```
