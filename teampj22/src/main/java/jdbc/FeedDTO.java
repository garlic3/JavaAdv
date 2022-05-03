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
		return bid;
	}
	public String getUid() {
		return uid;
	}
	public String getContent() {
		return content;
	}
	public String getTs() {
		return ts;
	}
	public String getImages() {
		return images;
	}
	public String getVideos() {
		return videos;
	}
	public String getLatitude() {
		return latitude;
	}
	public String getLongitude() {
		return longitude;
	}
	
	
	public FeedDTO(String bid, String uid, String content, String ts, String images, String videos, String latitude,
			String longitude) {
		super();
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
