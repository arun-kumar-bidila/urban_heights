import mongoose, { Schema, Model, Document } from "mongoose";

export interface IComplaint extends Document {
  title: string;
  description: string;
  status: string;
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
      default: "open",
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
