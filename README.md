# Byte: Custom Apex Chatbot

Welcome to the Byte: Custom Apex Chatbot repository! This project was developed during my internship at TaskUs during summer 2024 to enhance the Salesforce chatbot, Byte, with custom Apex code. The enhancements focus on improving the efficiency of sales reps by automating and streamlining key tasks within Salesforce.

## Overview

Byte is a Salesforce chatbot designed to assist sales representatives by automating complex tasks. This repository includes custom Apex code to extend Byte's functionality, allowing it to handle opportunities and cases more effectively, and to provide advanced predictive insights. Due to the scope of this project, the timeline was something to keep in mind, so only the main/most needed apex actions were implemented in the final version. 

## Features

### Opportunity Management
- **Create Opportunities:** Initiate new opportunities by providing essential details like name, amount, and close date.
- **Close Opportunities:** Update the status of an opportunity to 'Closed' and modify its description.

### Case Management
- **Create Cases:** Create new cases with subject and description fields, and assign them to specific users.
- **Update Case Descriptions:** Modify the description of existing cases, allowing for dynamic updates based on user input.

### Predictive Analytics
- **Opportunity Probability:** Calculate and display the likelihood of an opportunity closing based on its attributes.
- **Advanced Insights:** Analyze and present insights related to opportunities to aid in decision-making.

### Enhanced Data Handling
- **Dynamic Data Integration:** Fetch and update Salesforce data dynamically to ensure up-to-date information.
- **Custom Actions:** Utilize custom Apex actions for advanced operations within Salesforce.

## Getting Started

### Prerequisites
- Salesforce Developer Org or Sandbox environment.
- Basic understanding of Salesforce and Apex programming.
- Salesforce Developer Console or Salesforce CLI for deploying code.

### Setup Instructions

1. **Clone the Repository**
   ```bash
   git clone https://github.com/your-username/byte-custom-apex-chatbot.git
   cd byte-custom-apex-chatbot
