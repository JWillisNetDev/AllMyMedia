using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace AllMyMedia.Data.Models;

public class MediaUpload
{
	[Key, DatabaseGenerated(DatabaseGeneratedOption.Identity)]
	public string Id { get; set; } = Guid.NewGuid().ToString();

	[Required, StringLength(128)]
	public required string Title { get; set; }

	[Required]
	public required string BlobPath { get; set; }


}