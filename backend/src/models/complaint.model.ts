import mongoose, { Schema, Model, Document } from "mongoose";

export const ComplaintStatus = {
  OPEN: "open",
  IN_PROGRESS: "in_progress",
  RESOLVED: "resolved",
  CLOSED: "closed",
} as const;

export type ComplaintStatus =
  (typeof ComplaintStatus)[keyof typeof ComplaintStatus];

export interface IComplaint extends Document {
  title: string;
  description: string;
  status: ComplaintStatus;
  roomNumber: string;
  tenantName: string;
  tenantMobile: string;
  tenantId: mongoose.Types.ObjectId;
  roomId: mongoose.Types.ObjectId;
  apartmentId: mongoose.Types.ObjectId;
  createdAt: Date;
  updatedAt: Date;
}

const complaintSchema: Schema<IComplaint> = new Schema(
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
    status: {
      type: String,
      enum: Object.values(ComplaintStatus),
      default: ComplaintStatus.OPEN,
    },
    roomNumber: {
      type: String,
      required: true,
      trim: true,
    },
    tenantName: {
      type: String,
      required: true,
      trim: true,
    },
    tenantMobile: {
      type: String,
      required: true,
      trim: true,
    },
    tenantId: {
      type: mongoose.Schema.Types.ObjectId,
      required: true,
      ref: "Tenant",
    },
    roomId: {
      type: mongoose.Schema.Types.ObjectId,
      required: true,
      ref: "Room",
    },
    apartmentId: {
      type: mongoose.Schema.Types.ObjectId,
      required: true,
      ref: "Apartment",
    },
  },
  {
    timestamps: true,
  },
);

const Complaint: Model<IComplaint> = mongoose.model(
  "Complaint",
  complaintSchema,
);

export default Complaint;
