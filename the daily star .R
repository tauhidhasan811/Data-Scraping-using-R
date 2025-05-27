
library(rvest)
library(dplyr)
library(xml2)


# Step 2: Build the Google News search URL
search_url <- "https://www.thedailystar.net/business"

# Step 3: Download the page (note: this might not work well if JS is required)
webpage <- tryCatch(read_html(search_url), error = function(e) NULL)

# Step 4: Save the HTML to a file if download was successful
if (!is.null(webpage)) {
  html_text <- as.character(webpage)
  writeLines(html_text, "C:/Users/ASUS/Desktop/Data Science/Final/Data Scraping/0Dailt_star.html")
  cat("HTML content saved to 0Dailt_star.html\n")
} else {
  cat("Failed to download page. Possibly blocked or requires JavaScript.\n")
}


library(rvest)
library(dplyr)

# Step 1: Load the saved HTML file
page <- read_html("folder_path")  # Make sure this file exists in your working directory

# Step 2: Select all article cards
cards <- page %>%
  html_elements("div.card.position-relative")

# Step 3: Extract title, link, and intro
articles <- tibble(
  title = cards %>%
    html_element("h3.title a") %>%
    html_text2(),
  
  link = cards %>%
    html_element("h3.title a") %>%
    html_attr("href") %>%
    paste0("https://www.thedailystar.net", .),
  
  intro = cards %>%
    html_element("p.intro") %>%
    html_text2()
)

# Step 4: Save to CSV
write.csv(articles, "file_path", row.names = FALSE)





# Step 2: Build the Google News search URL
search_url <- "https://www.thedailystar.net/business/news/interest-payments-subsidies-soak-almost-half-budget-3895826"

# Step 3: Download the page (note: this might not work well if JS is required)
webpage <- tryCatch(read_html(search_url), error = function(e) NULL)

# Step 4: Save the HTML to a file if download was successful
if (!is.null(webpage)) {
  html_text <- as.character(webpage)
  writeLines(html_text, "saved_file_path")
  cat("HTML content saved to 0Dailt_star.html\n")
} else {
  cat("Failed to download page. Possibly blocked or requires JavaScript.\n")
}

library(rvest)

# Load the saved HTML file
page <- read_html("path")  # Adjust path as needed

# Extract all <p> tags inside <div class="pb-20 clearfix">
paragraphs <- page %>%
  html_elements("div.pb-20.clearfix p") %>%
  html_text2()

# View the result
print(paragraphs)


