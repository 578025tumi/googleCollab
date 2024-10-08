# googleCollab
Hartbeespoort Dam Image Downloader

This Python script downloads satellite images of the Hartbeespoort Dam area using Google Earth Engine and the Sentinel-2 dataset. It processes and saves images for the last three years, organizing them into separate folders by year.

Prerequisites

Python 3.6 or higher
Google Earth Engine account
Earth Engine Python API
geemap
python-dotenv
Installation

Clone this repository or download the script.
Install the required Python packages: pip install earthengine-api geemap python-dotenv
Set up your Google earth Engine acocunt and obtain your project ID.
Create a .env file in the same directory as the script with the following content, EarthEngine_Project="your-project-id-here".
Replace your-project-id-here with your actual Google Earth Engine project ID.
Usage

Run the script using Python: python main.py The script will:

Initialize Earth Engine with your project ID.
Define the Hartbeespoort Dam area.
Download Sentinel-2 images for the last three years, filtered by cloud coverage.
Process the images to show RGB bands.
Save the images as GeoTIFF files in separate folders for each year.
Output

The script creates three folders (one for each of the last three years) and populates them with GeoTIFF images of the Hartbeespoort Dam area. Each image filename includes the date of capture.

Customization

You can modify the following parameters in the script:

hartbeespoort_dam_center: The coordinates of the dam's center.
buffer_distance: The distance (in meters) to extend around the center point.
time_ranges: The date ranges for which to download images.
Notes

The script filters out images with more than 20% cloud coverage.
Images are downloaded at 10m resolution, matching Sentinel-2's native resolution for RGB bands.
The area of interest is defined as a rectangle around the dam's center point.
