# GA4 Data Parsing and Aggregation with BigQuery

This project leverages Google Analytics 4 (GA4) data within BigQuery to create structured, aggregated datasets. The goal is to transform raw event-level GA4 data into a format that allows for easier analysis of user sessions and interactions, along with detailed user, device, and geographic information.

## Project Overview

This project involves several key steps:
1. **Joining Event and User Data:** Merging GA4 event data with pseudonymous user data to enrich event records with user information.
2. **Filtering Recent Data:** Focusing on the most recent data and excluding irrelevant records.
3. **Expanding Nested Parameters:** Flattening nested event parameters to make key metrics accessible for analysis.
4. **Event-Level Aggregation:** Aggregating parameters and fields at the event level.
5. **Session-Level Aggregation:** Summarizing event details to create a session-based view, allowing for deeper analysis of user sessions.

## Data Processing Steps

### 1. Joining Event and User Data

This step joins event data with user data using a common identifier (`user_pseudo_id`). This allows us to associate event records with user-specific attributes, creating a more comprehensive dataset for analysis.

### 2. Filtering and Excluding Unnecessary Data

Only data from the last three days is included, with interim tables excluded. This helps keep the dataset up-to-date and manageable by focusing on recent events relevant for analysis.

### 3. Expanding Event Parameters

GA4 stores key details in nested `event_params`, where each parameter has a `key` and a `value`. By unnesting these, the parameters are expanded to become individual columns. This enables direct access to specific event details (e.g., `stream_id`, `ga_session_id`), which would otherwise be embedded in complex structures.

### 4. Aggregating Event Data

The project then aggregates data at the event level:
   - Key details such as `page_title`, `page_location`, `utm_source`, and `channel` are extracted.
   - Additional user, device, and geographic fields are also collected, allowing for a multidimensional view of each event.
   - This step organizes event details for quick retrieval and streamlined reporting.

### 5. Session-Level Aggregation

Finally, the dataset is aggregated at the session level to create an overview of user sessions:
   - Each session record includes consolidated attributes such as `device_category`, `location`, `utm_source`, and other key session identifiers.
   - The aggregated session data provides a summarized view of user interactions, highlighting the session duration, location, device, and referral source.
   - This view allows for high-level analysis of user engagement and behavior trends across sessions.

## Final Dataset Structure

The output of this process is a session-level dataset with the following characteristics:
- **User Identification:** Attributes like `user_id` and `user_pseudo_id`.
- **Session Attributes:** Session ID, first-touch timestamps, and date of the session.
- **Event Attributes:** Key metrics and event details such as `event_name`, `page_location`, and `campaign`.
- **Traffic Source:** Channel, medium, and source details for user acquisition tracking.
- **Device and Geographic Information:** User device type, brand, operating system, language, and location (city, country, continent).

## Summary

This project transforms complex, nested GA4 data into a structured format suitable for session-level analysis. The data provides insights into:
- **User Behavior:** Detailed view of individual user sessions and events.
- **Marketing Effectiveness:** Analyzing channels, UTM parameters, and referral sources to assess marketing performance.
- **Device and Geographic Segmentation:** Understanding user engagement by device type and geographic region.

The dataset now enables easier data visualization and detailed reporting, making it ready for further business intelligence and analytics.
