using AllMyMedia.Data.Models;
using Microsoft.EntityFrameworkCore;

namespace AllMyMedia.Data;

public class AllMyMediaDbContext : DbContext
{
	public AllMyMediaDbContext(DbContextOptions<AllMyMediaDbContext> options) : base(options)
	{
	}

	public DbSet<MediaUpload> MediaUploads => Set<MediaUpload>();

}