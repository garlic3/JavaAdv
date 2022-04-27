package jdbc;

public class FeedDTO {
	private String id;
	private String content;
	private String ts;
	private String images;
	private String videos;
	private String latitude;
	private String longitude;
	private String like;

	public String getId() {
		return this.id;
	}

	public String getContent() {
		return this.content;
	}

	public String getTs() {
		return this.ts;
	}

	public String getImages() {
		return this.images;
	}

	public String getVideos() {
		return this.videos;
	}

	public String getLatitude() {
		return this.latitude;
	}

	public String getLongitude() {
		return this.longitude;
	}
	
	public String getLike() {
		return this.like;
	}
	

	public FeedDTO(String id, String content, String ts, String images, String videos, String latitude,
			String longitude, String like) {
		this.id = id;
		this.content = content;
		this.ts = ts;
		this.images = images;
		this.videos = videos;
		this.latitude = latitude;
		this.longitude = longitude;
		this.like = like;
	}
}