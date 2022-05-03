package jdbc;

public class FeedDTO {
	private String bid;
	private String uid;
	private String content;
	private String ts;
	private String images;
	private String videos;
	private String latitude;
	private String longitude;

	public String getBid() {
		return this.bid;
	}

	public String getUid() {
		return this.uid;
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

	public FeedDTO(String bid, String content, String ts, String images, String videos, String latitude,
			String longitude) {
		this.bid = bid;
		this.content = content;
		this.ts = ts;
		this.images = images;
		this.videos = videos;
		this.latitude = latitude;
		this.longitude = longitude;
	}
	
	public FeedDTO(String bid, String uid,  String content, String ts, String images, String videos, String latitude,
			String longitude) {
		this.bid = bid;
		this.uid = uid;
		this.content = content;
		this.ts = ts;
		this.images = images;
		this.videos = videos;
		this.latitude = latitude;
		this.longitude = longitude;
	}
	
	
}