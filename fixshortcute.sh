# Dapatkan daftar semua shortcode unik dari direktori 'content'
unique_shortcodes=$(grep -r -o -E "{{%|{{< [a-zA-Z0-9_-]+" ./content | awk '{print $2}' | sort -u)
commit_flag=false  # Tanda untuk mengecek apakah ada file yang harus di-commit

# Array khusus untuk shortcode yang tidak ada dalam daftar "children"
missing_shortcodes=("children")

# Iterasi melalui setiap shortcode dan periksa apakah file template ada
for shortcode in $unique_shortcodes; do
  template_path="./layouts/shortcodes/$shortcode.html"

  if [[ ! -f "$template_path" ]]; then
    # Jika file tidak ada, buat file template sederhana
    echo "<!-- Template for $shortcode -->" > $template_path
    echo "<a href=\"{{ .Get 0 }}\">{{ .Inner }}</a>" >> $template_path
    echo "File template untuk shortcode '$shortcode' telah dibuat."

    # Tandai bahwa ada file yang perlu di-commit
    commit_flag=true

    # Tambahkan ke Git staging area
    git add $template_path
  fi
done

# Iterasi melalui shortcode yang tidak ada dalam daftar "children"
for missing_shortcode in "${missing_shortcodes[@]}"; do
  template_path="./layouts/shortcodes/$missing_shortcode.html"

  if [[ ! -f "$template_path" ]]; then
    # Jika file tidak ada, buat file template sederhana
    echo "<!-- Template for $missing_shortcode -->" > $template_path
    echo "<a href=\"{{ .Get 0 }}\">{{ .Inner }}</a>" >> $template_path
    echo "File template untuk shortcode '$missing_shortcode' telah dibuat."

    # Tandai bahwa ada file yang perlu di-commit
    commit_flag=true

    # Tambahkan ke Git staging area
    git add $template_path
  fi
done

# Jika ada file yang perlu di-commit, lakukan commit
if [ "$commit_flag" = true ]; then
  git commit -m "Add templates for missing shortcodes"
fi
  