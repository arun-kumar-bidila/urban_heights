import mongoose, { Document, Schema, Model } from "mongoose";

export interface IOwner extends Document {
  ownerName: string;
  ownerCode: string;
  ownerMobile: string;
  createdAt: Date;
  updatedAt: Date;
}

const ownerSchema: Schema<IOwner> = new Schema<IOwner>(
  {
    ownerName: {
      type: String,
      required: true,
      trim: true,
    },
    ownerCode: {
      type: String,
      required: true,
      trim: true,
    },
    ownerMobile: {
      type: String,
      required: true,
      trim: true,
    },
  },
  {
    timestamps: true,
  },
);

const Owner: Model<IOwner> = mongoose.model("owner", ownerSchema);

export default Owner;
