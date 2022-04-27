package jdbc;

public class BoardDTO {
	private String id;
	private String content;
	private String ts;
	private String images;
	private String videos;
	private String latitude;
	private String longitude;
	private String uid;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getTs() {
		return ts;
	}
	public void setTs(String ts) {
		this.ts = ts;
	}
	public String getImages() {
		return images;
	}
	public void setImages(String images) {
		this.images = images;
	}
	public String getVideos() {
		return videos;
	}
	public void setVideos(String videos) {
		this.videos = videos;
	}
	public String getLatitude() {
		return latitude;
	}
	public void setLatitude(String latitude) {
		this.latitude = latitude;
	}
	public String getLongitude() {
		return longitude;
	}
	public void setLongitude(String longitude) {
		this.longitude = longitude;
	}
	public String getUid() {
		return uid;
	}
	public void setUid(String uid) {
		this.uid = uid;
	}
	
	public BoardDTO() {
	}
	public BoardDTO(String id, String content, String ts, String images, String videos, String latitude,
			String longitude, String uid) {
		this.id = id;
		this.content = content;
		this.ts = ts;
		this.images = images;
		this.videos = videos;
		this.latitude = latitude;
		this.longitude = longitude;
		this.uid = uid;
	}
}
