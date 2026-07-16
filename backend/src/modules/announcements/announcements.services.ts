import Announcement from "../../models/announcement.model.ts";
import AppError from "../../utils/appError.ts";

export interface CreateAnnouncementRequest {
  title: string;
  description: string;
  datePosted: string;
  apartmentId: string;
}

export interface UpdateAnnouncementRequest {
  announcementId: string;
  pinned: boolean;
}

export interface SafeAnnouncement {
  announcementId: string;
  title: string;
  description: string;
  datePosted: string;
  pinned: boolean;
  apartmentId: string;
}

export const fetchAnnouncements = async (
  apartmentId: string,
): Promise<{ message: string; announcements: SafeAnnouncement[] }> => {
  const announcements = await Announcement.find({ apartmentId });

  return {
    message: "Announcements Fetch Success",
    announcements: announcements.map((announcement) => ({
      announcementId: announcement._id.toString(),
      title: announcement.title,
      description: announcement.description,
      datePosted: announcement.datePosted,
      pinned: announcement.pinned,
      apartmentId: announcement.apartmentId.toString(),
    })),
  };
};

export const createAnnouncement = async ({
  title,
  description,
  datePosted,
  apartmentId,
}: CreateAnnouncementRequest): Promise<{ message: string }> => {
  const result = await Announcement.create({
    title,
    description,
    datePosted,
    apartmentId,
  });

  return {
    message: "Announcement Created",
  };
};

export const deleteAnnouncement = async (
  announcementId: string,
): Promise<{ message: string }> => {
  const result = await Announcement.findByIdAndDelete(announcementId);

  if (!result) {
    throw new AppError("Failed to Delete Announcement", 400);
  }

  return {
    message: "Announcement Deleted",
  };
};

export const updateAnnouncement = async ({
  announcementId,
  pinned,
}: UpdateAnnouncementRequest): Promise<{ message: string }> => {
  const result = await Announcement.findByIdAndUpdate(
    announcementId,
    { pinned: pinned },
    { new: true },
  );

  if (!result) {
    throw new AppError("Failed to Update Announcement", 400);
  }

  return {
    message: "Announcement Updated",
  };
};
