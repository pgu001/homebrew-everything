# Homebrew Auto-updating Formula Template

This repository provides a template for creating and maintaining a Homebrew tap that automatically updates when new releases are published on GitHub. It's particularly useful for closed-source applications distributed through GitHub releases.

## Quick Start

### 1. Set Up Your Tap Repository

1. Create a new GitHub repository named `homebrew-yourtap`
2. Clone this template repository and push to your new repo:
   ```bash
   git clone https://github.com/your-username/homebrew-yourtap
   cd homebrew-yourtap
   ```

### 2. Configure Your Formula

1. Copy the template formula:
   ```bash
   cp Formula/application.rb Formula/your-app-name.rb
   ```

2. Edit `Formula/your-app-name.rb` and replace all placeholders:
   - `{REPLACE_WITH_FORMULA_NAME}` - Your formula class name (CamelCase)
   - `{REPLACE_WITH_DESCRIPTION}` - Application description
   - `{REPLACE_WITH_GITHUB_REPO}` - GitHub repository URL
   - `{REPLACE_WITH_VERSION}` - Initial version
   - `{REPLACE_WITH_ARM64_URL}` - ARM64 download URL
   - `{REPLACE_WITH_X86_64_URL}` - x86_64 download URL
   - Other placeholders as needed

### 3. Configure Auto-update Workflow

1. Edit `.github/workflows/update-clouddrive.yml` and replace all placeholders:
   - `{REPLACE_WITH_APP_NAME}` - Your application name
   - `{REPLACE_WITH_CRON_SCHEDULE}` - Update check schedule
   - `{REPLACE_WITH_GITHUB_OWNER}` - Source repository owner
   - `{REPLACE_WITH_GITHUB_REPO}` - Source repository name
   - `{REPLACE_WITH_GITHUB_USERNAME}` - Your GitHub username
   - `{REPLACE_WITH_TAP_REPO}` - Your tap repository name
   - `{REPLACE_WITH_GIT_EMAIL}` - Your Git email
   - `{REPLACE_WITH_GIT_USERNAME}` - Your Git username
   - URL patterns according to your release asset naming convention

### 4. Set Up GitHub Token

1. Generate a GitHub Personal Access Token:
   - Go to GitHub Settings → Developer settings → Personal access tokens
   - Generate a new token with `repo` scope
   - Copy the token

2. Add the token to your repository:
   - Go to your repository Settings → Secrets and variables → Actions
   - Create a new secret named `GH_TOKEN`
   - Paste your token as the value

### 5. Test Your Tap

1. Add your tap to Homebrew:
   ```bash
   brew tap your-username/yourtap
   ```

2. Install your application:
   ```bash
   brew install your-app-name
   ```

3. Verify the installation:
   ```bash
   your-app-name --version
   ```

## How It Works

1. The workflow runs on a schedule (defined by your cron expression)
2. It checks the source repository for new releases
3. When a new release is found:
   - Downloads the new release assets
   - Calculates SHA256 checksums
   - Updates the formula file
   - Commits and pushes changes

## Customization

### Formula Customization
- Edit `Formula/your-app-name.rb` to add dependencies
- Modify installation steps
- Add custom caveats
- Configure service management

### Workflow Customization
- Adjust the update check frequency
- Modify the release asset naming pattern
- Add additional validation steps
- Customize commit messages

## Troubleshooting

### Common Issues

1. **GitHub API Rate Limiting**
   - Ensure your GH_TOKEN is properly configured
   - Check token permissions

2. **Formula Update Failures**
   - Verify URL patterns match your release assets
   - Check SHA256 calculation logic
   - Ensure sed patterns match your formula structure

3. **Installation Issues**
   - Verify formula class name matches file name
   - Check all dependencies are properly specified
   - Ensure binary permissions are correct

## License

This template is available as open source under the terms of the [MIT License](LICENSE). 
