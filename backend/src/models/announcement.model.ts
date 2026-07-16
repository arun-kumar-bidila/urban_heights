import mongoose, { Schema, Document, Model } from "mongoose";

export interface IAnnouncement extends Document {
  title: string;
  description: string;
  datePosted: string;
  pinned: boolean;
  apartmentId: mongoose.Types.ObjectId;
  createdAt: Date;
  updatedAt: Date;
}

const announcementSchema: Schema<IAnnouncement> = new Schema<IAnnouncement>(
  {
    title: {
      type: String,
      required: true,
      trim: true,
    },
    description: {
      type: String,
      required: true,
      trim: true,
    },
    datePosted: {
      type: String,
      required: true,
      trim: true,
    },
    apartmentId: {
      type: mongoose.Schema.Types.ObjectId,
      ref: "Apartment",
      required: true,
      trim: true,
    },
    pinned: {
      type: Boolean,
      default: false,
    },
  },
  {
    timestamps: true,
  },
);

const Announcement: Model<IAnnouncement> = mongoose.model<IAnnouncement>(
  "Announcement",
  announcementSchema,
);

export default Announcement;
