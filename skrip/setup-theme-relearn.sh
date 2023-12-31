#!/bin/bash

# Define target domain
target_domain="https://adpit.github.io/arie_digital/"
github_editURL="https://github.com/adpit/arie_digital/edit/main/content/"
github_addURL="https://github.com/adpit/arie_digital/new/main/content"

# Pindah ke direktori content dari direktori skrip saat ini
cd ../

# Define webroot directory
webroot_dir="$PWD"

# Check if .gitmodules exists
if [ ! -f .gitmodules ]; then
  echo "File .gitmodules not found. Make sure it exists in the project root."
  exit 1
fi

# Ensure that the submodule is initialized and up to date
git submodule update --init --recursive

# Check if the submodule directory exists
if [ ! -d themes/hugo-theme-relearn ]; then
  echo "Submodule 'themes/hugo-theme-relearn' not found. Make sure it's initialized and located in the correct path."
  exit 1
fi

# Determine the correct sed command based on the operating system
if [[ "$OSTYPE" == "linux-gnu"* ]]; then
  sed_command="sed"
elif [[ "$OSTYPE" == "darwin"* ]]; then
  sed_command="gsed"
else
  echo "Unsupported operating system."
  exit 1
fi

# Copy files from submodule to webroot
cp -Rf themes/hugo-theme-relearn/exampleSite/* "$webroot_dir"

# Edit baseURL in Hugo configuration file using a different delimiter
config_file="$webroot_dir/config/_default/config.toml"
if [ -f "$config_file" ]; then
  $sed_command -i "s~baseURL = \"https://example.com/\"~baseURL = \"$target_domain\"~" "$config_file"
  $sed_command -i "s~editURL = \"https://github.com/McShelby/hugo-theme-relearn/edit/main/exampleSite/content/\"~editURL = \"$github_editURL\"~" "$config_file"

  # Add a new line with the "Add Content" button right below "Edit this page"
  $sed_command -i "/editURL/a addURL = \"$github_addURL\"" "$config_file"
  
  echo "Webroot files copied and configuration updated."
else
  echo "Hugo configuration file not found. Make sure it exists in the project root."
  exit 1
fi

# Edit themesdir in Hugo configuration file using a different delimiter
$sed_command -i 's~themesdir = "../.."~themesdir = "themes"~' "$config_file"

single_html_path="$webroot_dir/layouts/_default/single.html"

# Create layouts/_default directory if it doesn't exist
if [ ! -d "$webroot_dir/layouts/_default" ]; then
  mkdir -p "$webroot_dir/layouts/_default"
fi

# Create single.html file if it doesn't exist
if [ ! -f "$single_html_path" ]; then
  echo '<!-- layouts/_default/single.html -->
{{ define "main" }}
<article>
  <h1>{{ .Title }}</h1>
  {{ .Content }}
  <!-- Tambahkan tombol Edit di sini -->
  <a href="{{ .Site.Params.editURL }}">Edit this page</a>
  <a href="{{ .Site.Params.addURL }}" target="_blank">Add Content</a>
</article>
{{ end }}' > "$single_html_path"
fi
